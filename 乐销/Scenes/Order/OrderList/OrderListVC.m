//
//  OrderListVC.m
//中车运
//
//  Created by 隋林栋 on 2018/10/28.
//Copyright © 2018年 ping. All rights reserved.
//

#import "OrderListVC.h"
//cell
#import "OrderListCell.h"

//request
#import "RequestApi+Order.h"
//detail
#import "OrderDetailVC.h"
//bottom view
#import "OrderManagementBottomView.h"

@interface OrderListVC ()

@end

@implementation OrderListVC
@synthesize noResultView = _noResultView;
#pragma mark lazy init
- (BOOL)isShowNoResult{
    return true;
}
- (NoResultView *)noResultView{
    if (!_noResultView) {
        _noResultView = [NoResultView new];
        _noResultView.verticalModify = -HEIGHT_ORDERMANAGEMENTBOTTOMVIEW/2.0;
        [_noResultView resetWithImageName:@"empty_waybill_default" title:@"暂无运单信息"];
    }
    return _noResultView;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //table
    
    [self.tableView registerClass:[OrderListCell class] forCellReuseIdentifier:@"OrderListCell"];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    self.tableView.tableHeaderView = ^(){
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, W(3))];
//        view.backgroundColor = [UIColor clearColor];
//        return view;
//    }();
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, W(10), 0);
    [self addRefreshHeader];
    [self addRefreshFooter];
    //request
    [self requestList];
}


#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    OrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OrderListCell"];
    [cell resetCellWithModel: self.aryDatas[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return [OrderListCell fetchHeight:self.aryDatas[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ModelOrderList * model = self.aryDatas[indexPath.row];
    OrderDetailVC * detailVC = [OrderDetailVC new];
            detailVC.modelOrder = model;
            [GB_Nav pushViewController:detailVC animated:true];
}
#pragma mark request
- (void)requestList{

    NSString * strOrderType = self.states?strDotF(self.states):nil;
   
 [RequestApi requestOrderListWithWaybillnumber:nil
                                    categoryId:0
                                         state:strOrderType
                                      blNumber:0
                              shippingLineName:nil
                                    oceanVesel:nil
                                  voyageNumber:nil
                                  startContact:nil
                                    startPhone:nil
                                    endContact:nil endPhone:nil closingStartTime:0 closingEndTime:0 placeEnvName:nil placeStartTime:0 placeEndTime:0 placeContact:nil createStartTime:0 createEndTime:0 acceptStartTime:0 acceptEndTime:0 finishStartTime:0 finishEndTime:0 stuffStartTime:0 stuffEndTime:0 toFactoryStartTime:0 toFactoryEndTime:0 handleStartTime:0 handleEndTime:0
                                          page:self.pageNum
                                         count:50
                                         entId:[GlobalData sharedInstance].GB_CompanyModel.iDProperty
                                      delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.pageNum ++;
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelOrderList"];
    
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
