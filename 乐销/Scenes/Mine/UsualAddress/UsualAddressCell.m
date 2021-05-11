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


@implementation SelectAddressSearchView
#pragma mark 懒加载
-(UIButton *)btnSearch{
    if (_btnSearch == nil) {
        _btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSearch.tag = 1;
        [_btnSearch addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btnSearch.backgroundColor = [UIColor clearColor];
        [_btnSearch setTitleColor:COLOR_333 forState:UIControlStateNormal];
        _btnSearch.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnSearch setTitle:@"搜索" forState:(UIControlStateNormal)];
        _btnSearch.widthHeight = XY(W(60),W(45));
    }
    return _btnSearch;
}
- (UITextField *)tfSearch{
    if (_tfSearch == nil) {
        _tfSearch = [UITextField new];
        _tfSearch.font = [UIFont systemFontOfSize:F(13)];
        _tfSearch.textAlignment = NSTextAlignmentLeft;
        _tfSearch.placeholder = @"请输入常用地址";
        _tfSearch.borderStyle = UITextBorderStyleNone;
        _tfSearch.backgroundColor = [UIColor clearColor];
        _tfSearch.delegate = self;
        [_tfSearch addTarget:self action:@selector(textFileAction:) forControlEvents:(UIControlEventEditingChanged)];
    }
    return _tfSearch;
}
- (UIImageView *)iconSearch{
    if (_iconSearch == nil) {
        _iconSearch = [UIImageView new];
        _iconSearch.image = [UIImage imageNamed:@"attachCarTeam_search"];
        _iconSearch.widthHeight = XY(W(25),W(25));
    }
    return _iconSearch;
}
- (UIView *)viewBG{
    if (_viewBG == nil) {
        _viewBG = [UIView new];
        _viewBG.widthHeight = XY(W(300),W(35));
        _viewBG.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        [GlobalMethod setRoundView:_viewBG color:[UIColor clearColor] numRound:_viewBG.height/2.0 width:0];
        [_viewBG addTarget:self action:@selector(viewBGClick)];
    }
    return _viewBG;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.width = SCREEN_WIDTH;
        self.height = W(50);
        [self addSubView];
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.viewBG];
    [self addSubview:self.btnSearch];
    [self addSubview:self.tfSearch];
    [self addSubview:self.iconSearch];
    
    //初始化页面
    [self resetViewWithModel:nil];
}

#pragma mark 刷新view
- (void)resetViewWithModel:(id)model{
    [self removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    self.viewBG.leftTop = XY(W(14),W(5));
    
    self.iconSearch.leftCenterY = XY(W(24),self.viewBG.centerY);
    
    self.btnSearch.rightCenterY = XY(SCREEN_WIDTH,self.viewBG.centerY);
    self.tfSearch.widthHeight = XY(self.viewBG.width - W(50), self.tfSearch.font.lineHeight);
    self.tfSearch.leftCenterY = XY(self.viewBG.left + W(40),self.viewBG.centerY);
}
#pragma mark 点击事件
- (void)btnClick:(UIButton *)sender{
    [GlobalMethod endEditing];
    [self search];
}

#pragma mark textfield delegate
- (void)textFileAction:(UITextField *)tf{
    [self search];
    
}
- (void)search{
    NSString * strKey = self.tfSearch.text;
    if (self.blockSearch) {
        self.blockSearch(strKey);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [GlobalMethod endEditing];
    return true;
}
- (void)viewBGClick{
    [self.tfSearch becomeFirstResponder];
}

@end
