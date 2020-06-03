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
    self.tableView.height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - self.bottomView.height;
    [self.tableView registerClass:[SelectDriverCell class] forCellReuseIdentifier:@"SelectDriverCell"];
    
    
    
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
    [RequestApi requestCarWithEntid:[GlobalData sharedInstance].GB_CompanyModel.iDProperty contractEntId:self.modelCarTeamSelected.carrierEntId driverName:nil vehicleNumber:nil page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
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
