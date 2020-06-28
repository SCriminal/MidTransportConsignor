//
//  BulkCargoListManageVC.h
//  Driver
//
//  Created by 隋林栋 on 2019/7/17.
//Copyright © 2019 ping. All rights reserved.
//

#import "BaseVC.h"

@interface BulkCargoListManageVC : BaseVC
@property (nonatomic, strong) NSString *billNo;
@property (nonatomic, strong) NSString *carNo;
@property (nonatomic, strong) NSString *driverPhone;
- (void)refreshAll;
@end
