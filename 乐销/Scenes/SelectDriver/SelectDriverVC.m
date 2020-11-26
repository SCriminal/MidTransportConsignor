//
//  SelectDriverVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "SelectDriverVC.h"
//cell
#import "SelectDriverCell.h"
#import "BaseNavView+Logical.h"

@interface SelectDriverVC ()
@property (nonatomic, strong) SelectDriverBottomView *bottomView;
@property (nonatomic, strong) SelectDriverSearchView *searchView;
@property (nonatomic, strong) NSString *strKey;

@end

@implementation SelectDriverVC
@synthesize noResultView = _noResultView;
#pragma mark lazy init
- (BOOL)isShowNoResult{
    return true;
}
- (NoResultView *)noResultView{
    if (!_noResultView) {
        _noResultView = [NoResultView new];
        [_noResultView resetWithImageName:@"empty_driver" title:@"暂无司机数据"];
        _noResultView.backgroundColor = [UIColor clearColor];
    }
    return _noResultView;
}

- (SelectDriverSearchView *)searchView{
    if (!_searchView) {
        _searchView = [SelectDriverSearchView new];
        _searchView.top = NAVIGATIONBAR_HEIGHT;
        WEAKSELF
        _searchView.blockSearch = ^(NSString *key) {
            weakSelf.strKey = key;
            [weakSelf refreshHeaderAll];
        };
    }
    return _searchView;
}
//driver view
- (SelectDriverBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [SelectDriverBottomView new];
        _bottomView.bottom = SCREEN_HEIGHT;
        WEAKSELF
        _bottomView.blockSend = ^{
            if (weakSelf.blockSelected) {
                weakSelf.blockSelected(weakSelf.modelCarTeamSelected,weakSelf.modelSelected);
                [GB_Nav popMultiVC:2];
            }
        };
    }
    return _bottomView;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    //table
    [self.view addSubview:self.bottomView];
    self.tableView.height = SCREEN_HEIGHT - self.searchView.bottom - self.bottomView.height;
    [self.tableView registerClass:[SelectDriverCell class] forCellReuseIdentifier:@"SelectDriverCell"];
    [self.view addSubview:self.searchView];
    self.tableView.top = self.searchView.bottom;
    self.tableView.contentInset = UIEdgeInsetsMake(W(10), 0, 0, 0);
    
    
    [self addRefreshHeader];
    [self addRefreshFooter];
    
    //request
    [self requestList];
}

#pragma mark 添加导航栏
- (void)addNav{
    BaseNavView * nav = [BaseNavView initNavBackTitle:@"选择司机" rightView:nil];
    [self.view addSubview:nav];
}

#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectDriverCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelectDriverCell"];
    [cell resetCellWithModel:self.aryDatas[indexPath.row]];
    cell.ivSelect.highlighted = cell.model.driverId == self.modelSelected.driverId && (self.modelSelected.driverId != 0);
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SelectDriverCell fetchHeight:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectDriverCell * cell = (SelectDriverCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.modelSelected = cell.model;
    [self.tableView reloadData];
}


#pragma mark request
- (void)requestList{
    [RequestApi requestCarWithEntid:[GlobalData sharedInstance].GB_CompanyModel.iDProperty contractEntId:self.modelCarTeamSelected.carrierEntId driverName:nil vehicleNumber:isStr(self.strKey)?self.strKey:nil page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        if (![response isKindOfClass:NSDictionary.class]) {
            return ;
        }
        self.pageNum ++;
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelCar"];
        if (self.isRemoveAll) {
            [self.aryDatas removeAllObjects];
        }
        if (!isAry(aryRequest)) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.aryDatas addObjectsFromArray:aryRequest];
        
        [self.tableView reloadData];
        
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}


@end



@implementation SelectDriverSearchView
#pragma mark 懒加载
-(UIButton *)btnSearch{
    if (_btnSearch == nil) {
        _btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSearch.tag = 1;
        [_btnSearch addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btnSearch.backgroundColor = [UIColor clearColor];
        [_btnSearch setTitleColor:COLOR_333 forState:UIControlStateNormal];
        _btnSearch.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnSearch setTitle:@"搜索" forState:(UIControlStateNormal)];
        _btnSearch.widthHeight = XY(W(60),W(45));
    }
    return _btnSearch;
}
- (UITextField *)tfSearch{
    if (_tfSearch == nil) {
        _tfSearch = [UITextField new];
        _tfSearch.font = [UIFont systemFontOfSize:F(13)];
        _tfSearch.textAlignment = NSTextAlignmentLeft;
        _tfSearch.placeholder = @"请输入车牌号";
        _tfSearch.borderStyle = UITextBorderStyleNone;
        _tfSearch.backgroundColor = [UIColor clearColor];
        _tfSearch.delegate = self;
        [_tfSearch addTarget:self action:@selector(textFileAction:) forControlEvents:(UIControlEventEditingChanged)];
    }
    return _tfSearch;
}
- (UIImageView *)iconSearch{
    if (_iconSearch == nil) {
        _iconSearch = [UIImageView new];
        _iconSearch.image = [UIImage imageNamed:@"attachCarTeam_search"];
        _iconSearch.widthHeight = XY(W(25),W(25));
    }
    return _iconSearch;
}
- (UIView *)viewBG{
    if (_viewBG == nil) {
        _viewBG = [UIView new];
        _viewBG.widthHeight = XY(W(300),W(35));
        _viewBG.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        [GlobalMethod setRoundView:_viewBG color:[UIColor clearColor] numRound:_viewBG.height/2.0 width:0];
        [_viewBG addTarget:self action:@selector(viewBGClick)];
    }
    return _viewBG;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.width = SCREEN_WIDTH;
        self.height = W(50);
        [self addSubView];
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.viewBG];
    [self addSubview:self.btnSearch];
    [self addSubview:self.tfSearch];
    [self addSubview:self.iconSearch];
    
    //初始化页面
    [self resetViewWithModel:nil];
}

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model{
    [self removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    self.viewBG.leftTop = XY(W(14),W(5));
    
    self.iconSearch.leftCenterY = XY(W(24),self.viewBG.centerY);
    
    self.btnSearch.rightCenterY = XY(SCREEN_WIDTH,self.viewBG.centerY);
    self.tfSearch.widthHeight = XY(self.viewBG.width - W(50), self.tfSearch.font.lineHeight);
    self.tfSearch.leftCenterY = XY(self.viewBG.left + W(40),self.viewBG.centerY);
}
#pragma mark 点击事件
- (void)btnClick:(UIButton *)sender{
    [GlobalMethod endEditing];
    [self search];
}

#pragma mark textfield delegate
- (void)textFileAction:(UITextField *)tf{
    [self search];
    
}
- (void)search{
    NSString * strKey = self.tfSearch.text;
    if (self.blockSearch) {
        self.blockSearch(strKey);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [GlobalMethod endEditing];
    return true;
}
- (void)viewBGClick{
    [self.tfSearch becomeFirstResponder];
}

@end
