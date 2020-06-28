//
//  BulkCargoListVC.h
//  Driver
//
//  Created by 隋林栋 on 2019/7/17.
//Copyright © 2019 ping. All rights reserved.
//

#import "BaseTableVC.h"
//order list vc
#import "OrderListVC.h"

@interface BulkCargoListVC : BaseTableVC
@property (nonatomic, strong) NSString *billNo;
@property (nonatomic, strong) NSString *carNo;
@property (nonatomic, strong) NSString *driverPhone;

@property (nonatomic, assign) int type;

@end
