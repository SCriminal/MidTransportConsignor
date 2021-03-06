//
//  PerfectTextCell.h
//中车运
//
//  Created by 隋林栋 on 2018/10/24.
//Copyright © 2018年 ping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderTextView.h"

@interface PerfectTextCell : UITableViewCell<UITextFieldDelegate>

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UITextField *textField;
@property (nonatomic, strong) UIImageView *iconArrow;
@property (nonatomic, strong) ModelBaseData *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelBaseData *)model;
//reconfig text field left
- (void) reconfigTextFieldLeft:(CGFloat)left;
@end

@interface PerfectTextViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) PlaceHolderTextView *textField;
@property (nonatomic, strong) UIImageView *iconArrow;
@property (nonatomic, strong) ModelBaseData *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelBaseData *)model;
@end

@interface PerfectEmptyCell : UITableViewCell

@property (strong, nonatomic) UILabel *labelTitle;
@property (strong, nonatomic) UILabel *labelExample;
@property (nonatomic, strong) ModelBaseData *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(id)model;

@end
