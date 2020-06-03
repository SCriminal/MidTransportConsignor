//
//  SelectDriverVC.h
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "BaseTableVC.h"

@interface SelectDriverVC : BaseTableVC
@property (nonatomic, strong) ModelCar *modelSelected;
@property (nonatomic, strong) ModelCarTeam *modelCarTeamSelected;

@property (nonatomic, strong) void (^blockSelected)(ModelCarTeam *,ModelCar*);

@end
