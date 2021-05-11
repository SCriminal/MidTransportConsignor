//
//  SelectDriverCell.h
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDriverCell : UITableViewCell

//属性
@property (strong, nonatomic) UILabel *labelCarNumber;
@property (strong, nonatomic) UILabel *labelDriverName;
@property (strong, nonatomic) UILabel *labelProperty;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *ivSelect;
@property (nonatomic, strong) ModelCar *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelCar *)model;
@end


@interface SelectDriverBottomView : UIView

//属性
@property (strong, nonatomic) UIButton *btnSend;
@property (nonatomic, strong) void (^blockSend)();

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model;

@end


