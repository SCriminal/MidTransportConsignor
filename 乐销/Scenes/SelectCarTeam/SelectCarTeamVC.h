//
//  SelectCarTeamVC.h
//  Consignor
//
//  Created by 隋林栋 on 2019/12/25.
//Copyright © 2019 ping. All rights reserved.
//

#import "BaseTableVC.h"

@interface SelectCarTeamVC : BaseTableVC
@property (nonatomic, strong) ModelCarTeam *modelSelected;
@property (nonatomic, strong) void (^blockSelected)(ModelCarTeam *,ModelCar*);

@end
