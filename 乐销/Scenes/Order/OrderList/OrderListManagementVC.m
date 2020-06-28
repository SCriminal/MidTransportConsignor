//
//  OrderListManagementVC.m
//中车运
//
//  Created by 隋林栋 on 2018/10/28.
//Copyright © 2018年 ping. All rights reserved.
//

#import "OrderListManagementVC.h"
//滑动view
#import "SliderView.h"
//list vc
#import "OrderListVC.h"
//deck view
#import "UIViewController+IIViewDeckAdditions.h"
#import "IIViewDeckController.h"
//top slider view
#import "OrderManagementBottomView.h"
#import "BulkCargoListManageVC.h"
//add vc
#import "CreateBulkOrderVC.h"
//filter view
#import "BulkOrderFilterView.h"

@interface OrderListManagementVC ()<SliderViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) SliderView *sliderView;
@property (nonatomic, strong) UIScrollView *scAll;
@property (nonatomic, assign) BOOL isNotFirstLoad;
@property (nonatomic, strong) NSArray *arySliderDatas;
@property (nonatomic, strong) BaseNavView *nav;
@property (nonatomic, strong) UIImageView *ivHead;
@property (nonatomic, strong) UIControl *conHead;
@property (nonatomic, strong) UIControl *conFilter;
@property (nonatomic, strong) OrderManagementBottomView *bottomTypeSwitchView;
@property (nonatomic, strong) BulkCargoListManageVC *bulkManageVC;
@property (nonatomic, strong) UIImageView *iconAdd;
@property (nonatomic, strong) BulkOrderFilterView *filterView;

@end

@implementation OrderListManagementVC
#pragma mark lazy init
- (UIScrollView *)scAll{
    if (_scAll == nil) {
        _scAll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.sliderView.bottom +1, SCREEN_WIDTH, SCREEN_HEIGHT - self.sliderView.height-NAVIGATIONBAR_HEIGHT - HEIGHT_ORDERMANAGEMENTBOTTOMVIEW)];
        _scAll.contentSize = CGSizeMake(SCREEN_WIDTH *  self.arySliderDatas.count, 0);
        _scAll.backgroundColor = [UIColor clearColor];
        _scAll.delegate = self;
        _scAll.pagingEnabled = true;
        _scAll.showsVerticalScrollIndicator = false;
        _scAll.showsHorizontalScrollIndicator = false;
    }
    return _scAll;
}
- (UIImageView *)ivHead{
    if (!_ivHead) {
        _ivHead = [UIImageView new];
        _ivHead.backgroundColor = [UIColor clearColor];
        _ivHead.widthHeight = XY(W(30), W(30));
        [GlobalMethod setRoundView:_ivHead color:[UIColor clearColor] numRound:_ivHead.width/2.0 width:0];
        [_ivHead sd_setImageWithURL:[NSURL URLWithString:[GlobalData sharedInstance].GB_UserModel.headUrl] placeholderImage:[UIImage imageNamed:IMAGE_HEAD_DEFAULT]];
    }
    return _ivHead;
}
- (UIImageView *)iconAdd{
    if (!_iconAdd) {
        _iconAdd = [UIImageView new];
        _iconAdd.backgroundColor = [UIColor clearColor];
        _iconAdd.image = [UIImage imageNamed:@"order_add"];
        _iconAdd.widthHeight = XY(W(90), W(90));
//        _iconAdd.hidden = true;
        _iconAdd.rightBottom = XY(SCREEN_WIDTH, SCREEN_HEIGHT-W(5) -self.bottomTypeSwitchView.height);
        [_iconAdd addTarget:self action:@selector(addClick)];
    }
    return _iconAdd;
}
- (UIControl *)conHead {
    if (!_conHead) {
        _conHead = [UIControl new];
        _conHead.frame = CGRectMake(0, STATUSBAR_HEIGHT, W(100), NAVIGATIONBAR_HEIGHT - STATUSBAR_HEIGHT);
        [_conHead addSubview:self.ivHead];
        self.ivHead.leftCenterY = XY(W(20), _conHead.height/2.0);
        [_conHead addTarget:self action:@selector(headClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _conHead;
}
- (UIControl *)conFilter {
    if (!_conFilter) {
        _conFilter = [UIControl new];
        _conFilter.frame = CGRectMake(SCREEN_WIDTH - W(100), STATUSBAR_HEIGHT, W(100), NAVIGATIONBAR_HEIGHT - STATUSBAR_HEIGHT);
        {
            UIImageView * iv = [UIImageView new];
                       iv.backgroundColor = [UIColor clearColor];
                       iv.image = [UIImage imageNamed:@"nav_filter"];
                       iv.widthHeight = XY(W(25),W(25));
            iv.rightCenterY = XY(_conFilter.width-W(20),_conFilter.height/2.0);
            [_conFilter addSubview:iv];
        }
        [_conFilter addTarget:self action:@selector(filterClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _conFilter;
}
- (BulkCargoListManageVC *)bulkManageVC{
    if (!_bulkManageVC) {
        _bulkManageVC = [BulkCargoListManageVC new];
        _bulkManageVC.view.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - HEIGHT_ORDERMANAGEMENTBOTTOMVIEW);
//        _bulkManageVC.view.hidden = true;
    }
    return _bulkManageVC;
}
- (NSArray *)arySliderDatas{
    if (!_arySliderDatas) {
        _arySliderDatas = @[^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"全部";
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"待接单";
            model.num = 201;
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"运输中";
            model.num = 202;
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"运输完成";
            model.num = 210;
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"撤单中待确认";
            model.num = 211;
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"退单中待确认";
            model.num = 221;
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.title = @"运输关闭";
            model.num = 299;
            return model;
        }()];
    }
    return _arySliderDatas;
}
- (OrderManagementBottomView *)bottomTypeSwitchView{
    if (!_bottomTypeSwitchView) {
        _bottomTypeSwitchView = [OrderManagementBottomView new];
        _bottomTypeSwitchView.bottom = SCREEN_HEIGHT;
        WEAKSELF
        _bottomTypeSwitchView.blockIndexChange = ^(int index) {
            weakSelf.bulkManageVC.view.hidden = index == 1;
            weakSelf.conFilter.hidden = weakSelf.bulkManageVC.view.hidden;
            weakSelf.iconAdd.hidden = weakSelf.bulkManageVC.view.hidden;
        };
       
    }
    return _bottomTypeSwitchView;
}
- (BulkOrderFilterView *)filterView{
    if (!_filterView) {
        _filterView = [BulkOrderFilterView new];
        WEAKSELF
        _filterView.blockSearchClick = ^(NSString *strBillNo, NSString *strCarNo, NSString *strDriverPhone) {
            weakSelf.bulkManageVC.billNo = isStr(strBillNo)?strBillNo:nil;
            weakSelf.bulkManageVC.carNo = isStr(strCarNo)?strCarNo:nil;
            weakSelf.bulkManageVC.driverPhone = isStr(strDriverPhone)?strDriverPhone:nil;
            [weakSelf.bulkManageVC refreshAll];
        };
    }
    return _filterView;
}
- (SliderView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = ^(){
            SliderView * sliderView = [SliderView new];
            sliderView.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, W(50));
            sliderView.isHasSlider = true;
            sliderView.isScroll = true;
            sliderView.isLineVerticalHide = true;
            sliderView.viewSlidColor = [UIColor colorWithHexString:@"4E4745"];
            sliderView.viewSlidWidth = W(30);
            sliderView.delegate = self;
            sliderView.line.hidden = true;
            [sliderView resetWithAry:self.arySliderDatas];
            return sliderView;
        }();
    }
    return _sliderView;
}
- (BaseNavView *)nav{
    if (!_nav) {
        _nav = [BaseNavView initNavTitle:@"运单中心" leftView:self.conHead rightView:self.conFilter];
        _nav.line.hidden = true;
    }
    return _nav;
}

#pragma mark 初始化子控制器
- (void)setupChildVC
{
    for (int i = 0; i <self.arySliderDatas.count; i++) {
        ModelBtn * model = self.arySliderDatas[i];
        OrderListVC *sourceVC = [[OrderListVC alloc] init];
        sourceVC.states = model.num;
        sourceVC.view.frame = CGRectMake(SCREEN_WIDTH*i, 0, self.scAll.width, self.scAll.height);
        sourceVC.tableView.height = sourceVC.view.height;
        [self addChildViewController:sourceVC];
        [self.scAll addSubview:sourceVC.view];
    }
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    [self.view addSubview:self.sliderView];
    [self.view addSubview:self.scAll];
    [self setupChildVC];
    [self addBulkVC];
    [self.view addSubview:self.bottomTypeSwitchView];
    [self.view addSubview:self.iconAdd];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reconfigView) name:NOTICE_SELFMODEL_CHANGE object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshAll) name:NOTICE_ORDER_REFERSH object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshAll) name:UIApplicationDidBecomeActiveNotification object:nil];
    //request extend token
    [GlobalMethod requestExtendToken];
    
}
#pragma mark view did appear
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (!self.isNotFirstLoad) {
        self.isNotFirstLoad = true;
        return;
    }
    [self refreshAll];
}

#pragma mark refresh all
- (void)refreshAll{
    for (BaseTableVC * tableVC in self.childViewControllers) {
        if (tableVC && [tableVC isKindOfClass:[BaseTableVC class]]) {
            [tableVC refreshHeaderAll];
        }
    }
}
#pragma mark refonfig view
- (void)reconfigView{
    [self.ivHead sd_setImageWithURL:[NSURL URLWithString:[GlobalData sharedInstance].GB_UserModel.headUrl] placeholderImage:[UIImage imageNamed:IMAGE_HEAD_DEFAULT]];
}
#pragma mark click
- (void)headClick{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}
- (void)filterClick{
    [self.filterView show];
}
#pragma mark scrollview delegat
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self fetchCurrentView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
        [self fetchCurrentView];
    }
}
- (void)fetchCurrentView {
    // 获取已经滚动的比例
    double ratio = self.scAll.contentOffset.x / SCREEN_WIDTH;
    int    page  = (int)(ratio + 0.5);
    // scrollview 到page页时 将toolbar调至对应按钮
    [self.sliderView sliderToIndex:page noticeDelegate:NO];
}
#pragma mark slider delegate
- (void)protocolSliderViewBtnSelect:(NSUInteger)tag btn:(CustomSliderControl *)control{
    [UIView animateWithDuration:0.5 animations:^{
        self.scAll.contentOffset = CGPointMake(SCREEN_WIDTH * tag, 0);
        
    } completion:^(BOOL finished) {
        
    }];
    
}
#pragma mark 添加导航栏
- (void)addNav{
    [self.view addSubview:self.nav];
  
}
- (void)addBulkVC{
    [self addChildViewController:self.bulkManageVC];
    [self.view addSubview:self.bulkManageVC.view];
}
#pragma mark status bar
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
#pragma mark click
- (void)addClick{
    CreateBulkOrderVC * vc = [CreateBulkOrderVC new];
    WEAKSELF
    vc.blockBack = ^(UIViewController *item) {
        [weakSelf refreshAll];
    };
    [GB_Nav pushViewController:vc animated:true];
}
@end
