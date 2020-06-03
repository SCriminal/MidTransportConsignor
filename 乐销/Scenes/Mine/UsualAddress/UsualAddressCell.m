//
//  UsualAddressCell.m
//  Consignor
//
//  Created by 隋林栋 on 2019/12/26.
//Copyright © 2019 ping. All rights reserved.
//

#import "UsualAddressCell.h"

@interface UsualAddressCell ()

@end

@implementation UsualAddressCell
#pragma mark 懒加载
- (UILabel *)labelCompanyName{
    if (_labelCompanyName == nil) {
        _labelCompanyName = [UILabel new];
        _labelCompanyName.textColor = COLOR_333;
        _labelCompanyName.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightThin];
        _labelCompanyName.numberOfLines = 0;
        _labelCompanyName.lineSpace = 0;
    }
    return _labelCompanyName;
}
- (UILabel *)labelPeopleName{
    if (_labelPeopleName == nil) {
        _labelPeopleName = [UILabel new];
        _labelPeopleName.textColor = COLOR_666;
        _labelPeopleName.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightThin];
        _labelPeopleName.numberOfLines = 0;
        _labelPeopleName.lineSpace = 0;
    }
    return _labelPeopleName;
}
- (UILabel *)labelAddressDetail{
    if (_labelAddressDetail == nil) {
        _labelAddressDetail = [UILabel new];
        _labelAddressDetail.textColor = COLOR_666;
        _labelAddressDetail.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightThin];
        _labelAddressDetail.numberOfLines = 0;
        _labelAddressDetail.lineSpace = 0;
    }
    return _labelAddressDetail;
}
- (UIImageView *)iconEdit{
    if (_iconEdit == nil) {
        _iconEdit = [UIImageView new];
        _iconEdit.image = [UIImage imageNamed:@"UsualAddress_edit"];
        _iconEdit.widthHeight = XY(W(25),W(25));
    }
    return _iconEdit;
}
-(UIButton *)btnEdit{
    if (_btnEdit == nil) {
        _btnEdit = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnEdit.tag = 1;
        [_btnEdit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btnEdit.backgroundColor = [UIColor clearColor];
        _btnEdit.widthHeight = XY(SCREEN_WIDTH - W(30),W(40));
    }
    return _btnEdit;
}

#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.labelCompanyName];
        [self.contentView addSubview:self.labelPeopleName];
        [self.contentView addSubview:self.labelAddressDetail];
        [self.contentView addSubview:self.iconEdit];
        [self.contentView addSubview:self.btnEdit];
        
    }
    return self;
}
#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelUsualAddress *)model{
    self.model = model;
    [self.contentView removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    [self.labelCompanyName fitTitle:UnPackStr(model.entName) variable:SCREEN_WIDTH - W(45) - W(15)];
    self.labelCompanyName.leftTop = XY(W(15),W(20));
    
    [self.labelPeopleName fitTitle:[NSString stringWithFormat:@"%@ %@",UnPackStr(model.contact),UnPackStr(model.phone)] variable:SCREEN_WIDTH - W(45) - W(15)];
   
    self.labelPeopleName.leftTop = XY(W(15),self.labelCompanyName.bottom+W(15));
   
    [self.labelAddressDetail fitTitle:model.addressShow variable:SCREEN_WIDTH - W(45) - W(15)];
    self.labelAddressDetail.leftTop = XY(W(15),self.labelPeopleName.bottom+W(15));
    
    //设置总高度
    self.height = self.labelAddressDetail.bottom + W(20);
    [self.contentView addLineFrame:CGRectMake(0, self.height - 1, SCREEN_WIDTH, 1)];

    self.iconEdit.rightCenterY = XY(SCREEN_WIDTH - W(10),self.height/2.0);
    self.btnEdit.widthHeight = XY(W(45), self.height);
    self.btnEdit.rightTop = XY(SCREEN_WIDTH,0);
    
}
#pragma mark 点击事件
- (void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
        {
            if (self.blockEditClick ) {
                self.blockEditClick(self.model);
            }
        }
            break;
            
        default:
            break;
    }
}

@end
