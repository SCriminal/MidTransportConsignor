//
//  CreateBulkOrderCell.h
//  Consignor
//
//  Created by 隋林栋 on 2019/12/24.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateBulkOrderCell : UITableViewCell<UITextFieldDelegate>

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *labelUnit;
@property (nonatomic, strong) UIButton *btnUnit;

@property (strong, nonatomic) UITextField *textField;
@property (nonatomic, strong) UIImageView *iconArrow;
@property (nonatomic, strong) ModelBaseData *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelBaseData *)model;

@end
