//
//  OrderManagementTopView.m
//  Driver
//
//  Created by 隋林栋 on 2019/10/8.
//Copyright © 2019 ping. All rights reserved.
//

#import "OrderManagementBottomView.h"



@interface OrderManagementBottomView ()

@end

@implementation OrderManagementBottomView

#pragma mark 懒加载

- (UIView *)viewBG{
    if (!_viewBG) {
        _viewBG = [UIView new];
        _viewBG.backgroundColor = [UIColor whiteColor];
    }
    return _viewBG;
}
- (UILabel *)titleLeft{
    if (_titleLeft == nil) {
        _titleLeft = [UILabel new];
        _titleLeft.textColor = COLOR_ORANGE;
        _titleLeft.font =  [UIFont systemFontOfSize:F(10) weight:UIFontWeightRegular];
        [_titleLeft  fitTitle:@"散货运单"  variable:0];
    }
    return _titleLeft;
}
- (UIImageView *)iconLeft{
    if (_iconLeft == nil) {
        _iconLeft = [UIImageView new];
        _iconLeft.image = [UIImage imageNamed:@"order_bottom_right"];
        _iconLeft.highlightedImage = [UIImage imageNamed:@"order_bottom_right_selected"];
        [_iconLeft setHighlighted:true];
        _iconLeft.widthHeight = XY(W(20),W(20));
    }
    return _iconLeft;
}
- (UIControl *)conLeft{
    if (_conLeft == nil) {
        _conLeft = [UIControl new];
        _conLeft.tag = 1;
        [_conLeft addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        _conLeft.backgroundColor = [UIColor clearColor];
    }
    return _conLeft;
}
- (UILabel *)titleRight{
    if (_titleRight == nil) {
        _titleRight = [UILabel new];
        _titleRight.textColor = COLOR_999;
        _titleRight.font =  [UIFont systemFontOfSize:F(10) weight:UIFontWeightRegular];
        [_titleRight  fitTitle:@"集运运单"  variable:0];
    }
    return _titleRight;
}
- (UIImageView *)iconRight{
    if (_iconRight == nil) {
        _iconRight = [UIImageView new];
        _iconRight.image = [UIImage imageNamed:@"order_bottom_left"];
        _iconRight.highlightedImage = [UIImage imageNamed:@"order_bottom_left_selected"];

        _iconRight.widthHeight = XY(W(20),W(20));
    }
    return _iconRight;
}
- (UIControl *)conRight{
    if (_conRight == nil) {
        _conRight = [UIControl new];
        [_conRight addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        _conRight.backgroundColor = [UIColor clearColor];
    }
    return _conRight;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.widthHeight = XY(SCREEN_WIDTH,HEIGHT_ORDERMANAGEMENTBOTTOMVIEW+W(20));
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = false;
        [self addSubView];
    
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.viewBG];
    [self addSubview:self.titleLeft];
    [self addSubview:self.iconLeft];
    [self addSubview:self.conLeft];
    [self addSubview:self.titleRight];
    [self addSubview:self.iconRight];
    [self addSubview:self.conRight];

    [self resetWithModel:nil];
}

#pragma mark 刷新view
- (void)resetWithModel:(id)model{
    //刷新view
    self.iconLeft.centerXTop = XY(SCREEN_WIDTH/4.0,W(27));

    self.titleLeft.centerXTop = XY(self.iconLeft.centerX,self.iconLeft.bottom + W(5));
    
    self.conLeft.widthHeight = XY(W(80), self.height-W(20)) ;
    self.conLeft.centerXTop = XY(self.iconLeft.centerX, W(20));

    self.iconRight.centerXTop = XY(SCREEN_WIDTH/4.0*3.0,self.iconLeft.top);

    self.titleRight.centerXTop = XY(self.iconRight.centerX,self.iconRight.bottom + W(5));

    self.conRight.widthHeight = XY(W(80), self.conLeft.height) ;

    self.conRight.centerXTop = XY(self.iconRight.centerX, W(20));

    
 
    
    self.viewBG.widthHeight = XY(SCREEN_WIDTH, self.height - W(20));
    self.viewBG.leftTop = XY(0, W(20));
    
}

#pragma mark click
- (void)rightClick{
    [self clickLeft:false];
}

- (void)leftClick{
    [self clickLeft:true];
}

- (void)clickLeft:(BOOL)isLeft{
    if (self.blockIndexChange) {
        self.blockIndexChange(isLeft?0:1);
    }
    [self.iconLeft setHighlighted:isLeft];
    [self.iconRight setHighlighted:!isLeft];
    self.titleLeft.textColor = isLeft?COLOR_ORANGE:COLOR_999;
    self.titleRight.textColor = (!isLeft)?COLOR_ORANGE:COLOR_999;

}
@end
