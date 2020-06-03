//
//  SelectCarTeamCell.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "SelectCarTeamCell.h"

@interface SelectCarTeamCell ()

@end

@implementation SelectCarTeamCell
#pragma mark 懒加载
- (UILabel *)labelCompanyName{
    if (_labelCompanyName == nil) {
        _labelCompanyName = [UILabel new];
        _labelCompanyName.textColor = COLOR_333;
        _labelCompanyName.font =  [UIFont systemFontOfSize:F(16) ];
        _labelCompanyName.numberOfLines = 1;
        _labelCompanyName.lineSpace = 0;
    }
    return _labelCompanyName;
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
- (UILabel *)labelContactName{
    if (_labelContactName == nil) {
        _labelContactName = [UILabel new];
        _labelContactName.textColor = COLOR_666;
        _labelContactName.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _labelContactName.numberOfLines = 1;
        _labelContactName.lineSpace = 0;
    }
    return _labelContactName;
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
        [self.contentView addSubview:self.labelCompanyName];
        [self.contentView addSubview:self.labelContactName];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.ivSelect];
    }
    return self;
}

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelCarTeam *)model{
    self.model = model;
    [self.contentView removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    [self.labelCompanyName fitTitle:UnPackStr(model.carrierEntName) variable:SCREEN_WIDTH - W(50)];
    self.labelCompanyName.leftTop = XY(W(15),W(20));
    
    NSString * contact = isStr(model.carrierContact)&&isStr(model.carrierPhone)?[NSString stringWithFormat:@"%@ %@",UnPackStr(model.carrierContact),UnPackStr(model.carrierPhone)]:@"暂无联系人";
    [self.labelContactName fitTitle:contact variable:SCREEN_WIDTH - W(50)-W(10)];
    self.labelContactName.leftTop = XY(self.labelCompanyName.left,self.labelCompanyName.bottom+W(15));
    
    //设置总高度
    self.height = self.labelContactName.bottom + W(20);
    self.ivSelect.rightCenterY = XY(SCREEN_WIDTH - W(10), self.height/2.0);
    
    self.line.frame = CGRectMake(0, self.height - 1, SCREEN_WIDTH , 1);
}
@end



@implementation SelectCarTeamBottomView

-(UIButton *)btnSend{
    if (_btnSend == nil) {
        _btnSend = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSend addTarget:self action:@selector(btnSendClick) forControlEvents:UIControlEventTouchUpInside];
        _btnSend.backgroundColor = [UIColor whiteColor];
        _btnSend.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnSend setTitle:@"下一步" forState:(UIControlStateNormal)];
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
