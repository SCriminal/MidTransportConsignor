//
//  SelectCarTeamVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "SelectCarTeamVC.h"
//cell
#import "SelectCarTeamCell.h"
#import "BaseNavView+Logical.h"
//request
#import "RequestApi+Order.h"
//SelectDriverVC
#import "SelectDriverVC.h"

@interface SelectCarTeamVC ()
@property (nonatomic, strong) SelectCarTeamBottomView *bottomView;
@property (nonatomic, strong) ModelCarTeam *ModelCarTeamSelected;

@end

@implementation SelectCarTeamVC
@synthesize noResultView = _noResultView;
#pragma mark lazy init
- (BOOL)isShowNoResult{
    return true;
}
- (NoResultView *)noResultView{
    if (!_noResultView) {
        _noResultView = [NoResultView new];
        [_noResultView resetWithImageName:@"empty_car" title:@"暂无车队数据"];
        _noResultView.backgroundColor = [UIColor clearColor];
    }
    return _noResultView;
}
- (SelectCarTeamBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [SelectCarTeamBottomView new];
        _bottomView.bottom = SCREEN_HEIGHT;
        WEAKSELF
        _bottomView.blockSend = ^{
            SelectDriverVC * vc = [SelectDriverVC new];
            vc.blockSelected = weakSelf.blockSelected;
            vc.modelCarTeamSelected = weakSelf.modelSelected;
            [GB_Nav pushViewController:vc animated:true];
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
    [self.tableView registerClass:[SelectCarTeamCell class] forCellReuseIdentifier:@"SelectCarTeamCell"];
    [self.view addSubview:self.bottomView];
    self.tableView.height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - self.bottomView.height;
    [self addRefreshHeader];
    [self addRefreshFooter];
    //request
    [self requestList];
}

#pragma mark 添加导航栏
- (void)addNav{
    BaseNavView * nav = [BaseNavView initNavBackTitle:@"选择车队" rightView:nil];
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
    SelectCarTeamCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelectCarTeamCell"];
    ModelCarTeam * model = self.aryDatas[indexPath.row];
    [cell resetCellWithModel:model];
    cell.ivSelect.highlighted = model.iDProperty == self.modelSelected.iDProperty;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SelectCarTeamCell fetchHeight:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectCarTeamCell * cell = (SelectCarTeamCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.modelSelected = cell.model;
    [self.tableView reloadData];
}


#pragma mark request
- (void)requestList{
    [RequestApi requestCarTeamWithEntid:[GlobalData sharedInstance].GB_CompanyModel.iDProperty carrierEntName:nil carrierEntSimpleName:nil page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.pageNum ++;
        
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelCarTeam"];
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
