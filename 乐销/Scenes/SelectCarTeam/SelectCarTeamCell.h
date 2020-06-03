//
//  SelectCarTeamCell.h
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCarTeamCell : UITableViewCell

//属性
@property (strong, nonatomic) UILabel *labelCompanyName;
@property (strong, nonatomic) UILabel *labelContactName;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *ivSelect;
@property (nonatomic, strong) ModelCarTeam *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelCarTeam *)model;

@end


@interface SelectCarTeamBottomView : UIView
//属性
@property (strong, nonatomic) UIButton *btnSend;
@property (nonatomic, strong) void (^blockSend)();

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model;

@end
