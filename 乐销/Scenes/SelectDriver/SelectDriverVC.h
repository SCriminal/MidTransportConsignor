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

@interface SelectDriverSearchView : UIView<UITextFieldDelegate>
//属性
@property (strong, nonatomic) UIButton *btnSearch;
@property (strong, nonatomic) UITextField *tfSearch;
@property (strong, nonatomic) UIImageView *iconSearch;
@property (strong, nonatomic) UIView *viewBG;
@property (nonatomic, strong) void (^blockSearch)(NSString *);

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model;

@end
