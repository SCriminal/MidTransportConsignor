//
//  UsualAddress.m
//  Consignor
//
//  Created by 隋林栋 on 2019/12/23.
//Copyright © 2019 ping. All rights reserved.
//

#import "UsualAddressVC.h"
//cell
#import "UsualAddressCell.h"
//request
#import "RequestApi+Company.h"
//edit vc
#import "EditUsualAddressVC.h"

@interface UsualAddressVC ()
@property (nonatomic, strong) SelectAddressSearchView *searchView;
@property (nonatomic, strong) NSString *strKey;

@end

@implementation UsualAddressVC
- (SelectAddressSearchView *)searchView{
    if (!_searchView) {
        _searchView = [SelectAddressSearchView new];
        _searchView.top = NAVIGATIONBAR_HEIGHT;
        WEAKSELF
        _searchView.blockSearch = ^(NSString *key) {
            weakSelf.strKey = key;
            [weakSelf refreshHeaderAll];
        };
    }
    return _searchView;
}

#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    //table
    [self.tableView registerClass:[UsualAddressCell class] forCellReuseIdentifier:@"UsualAddressCell"];
    if (self.blockSelected) {
        self.tableView.height = SCREEN_HEIGHT - self.searchView.bottom;
        [self.view addSubview:self.searchView];
        self.tableView.top = self.searchView.bottom;
    }
   
    //request
    [self requestList];
    [self addRefreshHeader];
    [self addRefreshFooter];
}

#pragma mark 添加导航栏
- (void)addNav{
    WEAKSELF
    [self.view addSubview:[BaseNavView initNavBackTitle:self.blockSelected?@"选择常用地址":@"常用地址管理" rightTitle:@"添加新地址" rightBlock:^{
        EditUsualAddressVC * editVC = [EditUsualAddressVC new];
        editVC.blockBack = ^(UIViewController *vc) {
            if (vc.requestState) {
                [weakSelf refreshHeaderAll];
            }
        };
        [GB_Nav pushViewController:editVC animated:true];
    }]];
}

#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UsualAddressCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UsualAddressCell"];
    [cell resetCellWithModel:self.aryDatas[indexPath.row]];
    WEAKSELF
    cell.blockEditClick = ^(ModelUsualAddress *item) {
        EditUsualAddressVC * editVC = [EditUsualAddressVC new ];
        editVC.modelUsualAddress = item;
        editVC.blockBack = ^(UIViewController *vc) {
            if (vc.requestState) {
                [weakSelf refreshHeaderAll];
            }
        };
        [GB_Nav pushViewController:editVC animated:true];
    };
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UsualAddressCell fetchHeight:self.aryDatas[indexPath.row]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.blockSelected) {
        ModelUsualAddress * model = self.aryDatas[indexPath.row];
        self.blockSelected(model);
        [GB_Nav popViewControllerAnimated:   true];
    }
}
#pragma mark request
- (void)requestList{
    [RequestApi requestUsuslAddressListWithId:0 type:0 countyName:nil provinceName:nil cityName:nil countyId:0 entId:strDotF([GlobalData sharedInstance].GB_CompanyModel.iDProperty) townId:0 provinceId:0 townName:nil cityId:0 phone:nil contact:nil entName:self.strKey startTime:0 endTime:nil page:self.pageNum count:@"50" detailAddr:nil delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        if (![response isKindOfClass:[NSDictionary class]]) {
            return ;
        }
        self.pageNum ++;
        
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelUsualAddress"];
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
