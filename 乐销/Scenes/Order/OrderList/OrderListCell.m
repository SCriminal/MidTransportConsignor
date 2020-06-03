//
//  OrderListCell.m
//中车运
//
//  Created by 隋林栋 on 2018/10/28.
//Copyright © 2018年 ping. All rights reserved.
//

#import "OrderListCell.h"
//order detail vc
#import "OrderDetailVC.h"
//request
#import "RequestApi+Order.h"

@interface OrderListCell ()

@end

@implementation OrderListCell
#pragma mark 懒加载
- (UILabel *)labelBillNo{
    if (_labelBillNo == nil) {
        _labelBillNo = [UILabel new];
        _labelBillNo.textColor = COLOR_333;
        _labelBillNo.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightBold];
        _labelBillNo.numberOfLines = 1;
        _labelBillNo.lineSpace = 0;
    }
    return _labelBillNo;
}
- (UIView *)colorLine{
    if (!_colorLine) {
        _colorLine = [UIView new];
        _colorLine.widthHeight = XY(W(5), W(30));
        _colorLine.backgroundColor = COLOR_BLUE;
        [GlobalMethod setRoundView:_colorLine color:[UIColor clearColor] numRound:_colorLine.width/2.0 width:0];
    }
    return _colorLine;
}
- (UILabel *)labelOrderNo{
    if (_labelOrderNo == nil) {
        _labelOrderNo = [UILabel new];
        _labelOrderNo.textColor = COLOR_999;
        _labelOrderNo.font =  [UIFont systemFontOfSize:F(13) weight:UIFontWeightRegular];
        _labelOrderNo.numberOfLines = 1;
        _labelOrderNo.lineSpace = 0;
    }
    return _labelOrderNo;
}
- (UILabel *)labelStatus{
    if (_labelStatus == nil) {
        _labelStatus = [UILabel new];
        _labelStatus.textColor = COLOR_BLUE;
        _labelStatus.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightBold];
        _labelStatus.numberOfLines = 1;
        _labelStatus.lineSpace = 0;
    }
    return _labelStatus;
}


- (UILabel *)labelAddressFrom{
    if (_labelAddressFrom == nil) {
        _labelAddressFrom = [UILabel new];
        _labelAddressFrom.textColor = COLOR_333;
        _labelAddressFrom.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelAddressFrom.numberOfLines = 1;
        _labelAddressFrom.lineSpace = 0;
    }
    return _labelAddressFrom;
}
- (UILabel *)labelAddressTo{
    if (_labelAddressTo == nil) {
        _labelAddressTo = [UILabel new];
        _labelAddressTo.textColor = COLOR_333;
        _labelAddressTo.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelAddressTo.numberOfLines = 1;
        _labelAddressTo.lineSpace = 0;
    }
    return _labelAddressTo;
}
- (UILabel *)labelCompany{
    if (_labelCompany == nil) {
        _labelCompany = [UILabel new];
        _labelCompany.textColor = COLOR_333;
        _labelCompany.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelCompany.numberOfLines = 1;
        _labelCompany.lineSpace = 0;
    }
    return _labelCompany;
}
- (UILabel *)labelPortType{
    if (_labelPortType == nil) {
        _labelPortType = [UILabel new];
        _labelPortType.textColor = COLOR_333;
        _labelPortType.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelPortType.numberOfLines = 1;
        _labelPortType.lineSpace = 0;
    }
    return _labelPortType;
}

- (UIImageView *)ivCompany{
    if (_ivCompany == nil) {
        _ivCompany = [UIImageView new];
        _ivCompany.image = [UIImage imageNamed:@"orderCell_time"];
        _ivCompany.widthHeight = XY(W(25),W(25));
    }
    return _ivCompany;
}
- (UIImageView *)ivPortType{
    if (_ivPortType == nil) {
        _ivPortType = [UIImageView new];
        _ivPortType.image = [UIImage imageNamed:@"orderCell_type"];
        _ivPortType.widthHeight = XY(W(25),W(25));
    }
    return _ivPortType;
}
- (UIImageView *)ivBg{
    if (_ivBg == nil) {
        _ivBg = [UIImageView new];
        _ivBg.image = IMAGE_WHITE_BG;
        _ivBg.backgroundColor = [UIColor clearColor];
    }
    return _ivBg;
}
- (UIView *)viewBG{
    if (!_viewBG) {
        _viewBG = [UIView new];
        _viewBG.backgroundColor = [UIColor clearColor];
        _viewBG.width = SCREEN_WIDTH;
    }
    return _viewBG;
}
- (UIView *)dotBlue{
    if (_dotBlue == nil) {
        _dotBlue = [UIView new];
        _dotBlue.backgroundColor = COLOR_BLUE;
        _dotBlue.widthHeight = XY(W(7), W(7));
        [GlobalMethod setRoundView:_dotBlue color:[UIColor clearColor] numRound:_dotBlue.width/2.0 width:0];

    }
    return _dotBlue;
}
- (UIView *)lineVertical{
    if (_lineVertical == nil) {
        _lineVertical = [UIView new];
        _lineVertical.backgroundColor = COLOR_LINE;
    }
    return _lineVertical;
}
- (UIView *)dotRed{
    if (_dotRed == nil) {
        _dotRed = [UIView new];
        _dotRed.backgroundColor = COLOR_ORANGE;
        _dotRed.widthHeight = XY(W(7), W(7));
        [GlobalMethod setRoundView:_dotRed color:[UIColor clearColor] numRound:_dotRed.width/2.0 width:0];
    }
    return _dotRed;
}


#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = COLOR_BACKGROUND;
        self.backgroundColor = COLOR_BACKGROUND;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = false;
        self.contentView.clipsToBounds = false;
        [self.contentView addSubview:self.ivBg];
        [self.contentView addSubview:self.viewBG];
        [self.viewBG addSubview:self.labelBillNo];
        [self.viewBG addSubview:self.labelOrderNo];
        [self.viewBG addSubview:self.labelStatus];
        [self.viewBG addSubview:self.labelCompany];
        [self.viewBG addSubview:self.labelAddressFrom];
        [self.viewBG addSubview:self.labelAddressTo];
        [self.viewBG addSubview:self.labelPortType];
        [self.viewBG addSubview:self.ivPortType];
        [self.viewBG addSubview:self.ivCompany];
        [self.viewBG addSubview:self.lineVertical];
        [self.viewBG addSubview:self.dotBlue];
        [self.viewBG addSubview:self.dotRed];
        [self.viewBG addSubview:self.colorLine];
    }
    return self;
}
#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelOrderList *)model{
    self.model = model;
    [self.viewBG removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    
    [self.labelStatus fitTitle:model.orderStatusShow variable:0];
    self.labelStatus.textColor = model.colorStateShow;
    self.labelStatus.rightTop = XY(self.viewBG.width - W(25),W(36));

    self.colorLine.left = W(25);
    self.colorLine.backgroundColor = model.colorStateShow;

    [self.labelBillNo fitTitle:[NSString stringWithFormat:@"提单号：%@",UnPackStr(model.blNumber)] fixed:self.labelStatus.left - W(30) - self.colorLine.right];
    self.labelBillNo.leftCenterY = XY(self.colorLine.right + W(20),self.labelStatus.centerY);
    
    [self.labelOrderNo fitTitle:[NSString stringWithFormat:@"运单编号：%@",UnPackStr(model.waybillNumber)] fixed:self.viewBG.width - W(30)- self.colorLine.right];
    self.labelOrderNo.leftTop = XY(self.labelBillNo.left,self.labelBillNo.bottom + W(13));
    
    self.colorLine.centerY = self.labelBillNo.bottom + W(13)/2.0;

    CGFloat bottom =  [self.viewBG addLineFrame:CGRectMake(W(25), self.labelOrderNo.bottom + W(20), self.viewBG.width - W(50), 1)];
    
    self.ivCompany.leftTop = XY(W(25),bottom+W(14));
    

    [self.labelCompany fitTitle:[GlobalMethod exchangeTimeWithStamp:model.closingTime andFormatter:TIME_SEC_SHOW] variable:self.viewBG.width - self.ivCompany.right - W(40)];
    self.labelCompany.leftCenterY = XY(self.ivCompany.right + W(11),self.ivCompany.centerY);
    
    
    self.ivPortType.leftTop = XY(self.ivCompany.left,self.ivCompany.bottom + W(10));
    
    [self.labelPortType fitTitle:[NSString stringWithFormat:@"%@ ",model.orderType== ENUM_ORDER_TYPE_INPUT?@"进口运单":@"出口运单"] variable:self.viewBG.width - self.ivPortType.right - W(40)];
    self.labelPortType.leftCenterY = XY(self.ivPortType.right + W(11),self.ivPortType.centerY);


    self.dotBlue.centerXTop = XY(self.ivPortType.centerX, self.ivPortType.bottom + W(19));
    
    [self.labelAddressFrom fitTitle:[NSString stringWithFormat:@"%@：%@",model.orderType == ENUM_ORDER_TYPE_INPUT?@"提箱港":@"提箱点",UnPackStr(model.backPackageAddressShow)] variable:self.viewBG.width - self.dotBlue.right - W(40)];
    self.labelAddressFrom.leftCenterY = XY(self.dotBlue.right + W(20),self.dotBlue.centerY);
    
    self.dotRed.centerXTop = XY(self.ivPortType.centerX, self.dotBlue.bottom + W(28));
    [self.labelAddressTo fitTitle:[NSString stringWithFormat:@"%@：%@",model.orderType == ENUM_ORDER_TYPE_INPUT?@"卸货地":@"装货地",UnPackStr(model.loadAddressShow)] variable:self.viewBG.width - self.dotBlue.right - W(40)];
    self.labelAddressTo.leftCenterY = XY(self.labelAddressFrom.left,self.dotRed.centerY);

    self.lineVertical.frame = CGRectMake(self.dotRed.centerX-1, self.dotRed.centerY, 1, self.dotBlue.centerY - self.dotRed.centerY);
    
    
    self.viewBG.height = self.labelAddressTo.bottom +W(16);
    self.ivBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.viewBG.height+W(10));
    //设置总高度
    self.height = self.viewBG.bottom;
    
}

@end

