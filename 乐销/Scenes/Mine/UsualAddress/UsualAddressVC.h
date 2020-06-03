//
//  UsualAddress.h
//  Consignor
//
//  Created by 隋林栋 on 2019/12/23.
//Copyright © 2019 ping. All rights reserved.
//

#import "BaseTableVC.h"

@interface UsualAddressVC : BaseTableVC
@property (nonatomic, strong) void (^blockSelected)(ModelUsualAddress *);

@end
