//
//  SelectDriverCell.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "SelectDriverCell.h"

@interface SelectDriverCell ()

@end

@implementation SelectDriverCell
#pragma mark 懒加载
- (UILabel *)labelCarNumber{
    if (_labelCarNumber == nil) {
        _labelCarNumber = [UILabel new];
        _labelCarNumber.textColor = COLOR_333;
        _labelCarNumber.font =  [UIFont systemFontOfSize:F(16) ];
        _labelCarNumber.numberOfLines = 1;
        _labelCarNumber.lineSpace = 0;
    }
    return _labelCarNumber;
}

- (UIImageView *)ivSelect{
    if (!_ivSelect) {
        _ivSelect = [UIImageView new];
        _ivSelect.widthHeight = XY(W(25), W(25));
        _ivSelect.backgroundColor = [UIColor clearColor];
        _ivSelect.image = [UIImage imageNamed:@"account_choose_default"];
        _ivSelect.highlightedImage = [UIImage imageNamed:@"account_choose_selected"];
    }
    return _ivSelect;
}
- (UILabel *)labelDriverName{
    if (_labelDriverName == nil) {
        _labelDriverName = [UILabel new];
        _labelDriverName.textColor = COLOR_666;
        _labelDriverName.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelDriverName.numberOfLines = 1;
        _labelDriverName.lineSpace = 0;
    }
    return _labelDriverName;
}
- (UILabel *)labelProperty{
    if (_labelProperty == nil) {
        _labelProperty = [UILabel new];
        _labelProperty.textColor = COLOR_666;
        _labelProperty.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelProperty.numberOfLines = 1;
        _labelProperty.lineSpace = 0;
    }
    return _labelProperty;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = COLOR_LINE;
    }
    return _line;
}

#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.labelCarNumber];
        [self.contentView addSubview:self.labelProperty];
        [self.contentView addSubview:self.labelDriverName];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.ivSelect];
    }
    return self;
}

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelCar *)model{
    self.model = model;
    [self.contentView removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    [self.labelCarNumber fitTitle:UnPackStr(model.vehicleNumber) variable:SCREEN_WIDTH - W(50)];
    self.labelCarNumber.leftTop = XY(W(15),W(20));
    
    [self.labelDriverName fitTitle:[NSString stringWithFormat:@"%@ %@",UnPackStr(model.name),UnPackStr(model.driverPhone)] variable:SCREEN_WIDTH - W(50) - self.labelCarNumber.right];
    self.labelDriverName.leftCenterY = XY(self.labelCarNumber.right+ W(20),self.labelCarNumber.centerY);
    
   
    [self.labelProperty fitTitle:UnPackStr(model.vehiclePropertyShow) variable:SCREEN_WIDTH - W(50)-W(10)];
    self.labelProperty.leftTop = XY(self.labelCarNumber.left,self.labelCarNumber.bottom+W(13));
    
    //设置总高度
    self.height = self.labelProperty.bottom + W(20);
    self.ivSelect.rightCenterY = XY(SCREEN_WIDTH - W(10), self.height/2.0);
    self.line.frame = CGRectMake(0, self.height - 1, SCREEN_WIDTH , 1);
}

@end

@implementation SelectDriverBottomView

-(UIButton *)btnSend{
    if (_btnSend == nil) {
        _btnSend = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSend addTarget:self action:@selector(btnSendClick) forControlEvents:UIControlEventTouchUpInside];
        _btnSend.backgroundColor = [UIColor whiteColor];
        _btnSend.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnSend setTitle:@"选定司机" forState:(UIControlStateNormal)];
        [_btnSend setTitleColor:COLOR_ORANGE forState:UIControlStateNormal];
        _btnSend.widthHeight = XY( W(125),W(40));
        [GlobalMethod setRoundView:_btnSend color:COLOR_ORANGE numRound:_btnSend.height/2.0 width:1];
    }
    return _btnSend;
}


#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.width = SCREEN_WIDTH;
        [self addSubView];
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.btnSend];
    
    //初始化页面
    [self resetViewWithModel:nil];
}

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model{
    [self removeSubViewWithTag:TAG_LINE];//移除线
    //设置总高度
    CGFloat height = W(54);
    //刷新view
    self.btnSend.rightCenterY = XY(SCREEN_WIDTH -  W(15),height/2.0);
    
    self.height = height + iphoneXBottomInterval;
    
    [self addLineFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
}
#pragma mark 点击事件
- (void)btnSendClick{
    if (self.blockSend) {
        self.blockSend();
    }
}

@end
