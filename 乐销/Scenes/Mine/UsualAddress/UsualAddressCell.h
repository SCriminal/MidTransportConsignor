//
//  UsualAddressCell.h
//  Consignor
//
//  Created by 隋林栋 on 2019/12/26.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsualAddressCell : UITableViewCell
@property (nonatomic, strong) UILabel *labelCompanyName;
@property (nonatomic, strong) UILabel *labelPeopleName;
@property (nonatomic, strong) UILabel *labelAddressDetail;
@property (nonatomic, strong) UIImageView *iconEdit;
@property (nonatomic, strong) UIButton *btnEdit;
@property (nonatomic, strong) ModelUsualAddress *model;
@property (nonatomic, strong) void (^blockEditClick)(ModelUsualAddress *);

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelUsualAddress *)model;

@end
