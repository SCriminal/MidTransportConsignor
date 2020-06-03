//
//  EditUsualAddressVC.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/17.
//Copyright © 2019 ping. All rights reserved.
//

#import "EditUsualAddressVC.h"
//keyboard observe
#import "BaseTableVC+KeyboardObserve.h"
//SelectDistrictView select
#import "SelectDistrictView.h"
//request
#import "RequestApi+Company.h"
//nav
#import "BaseNavView+Logical.h"
#import "BaseTableVC+Authority.h"

@interface EditUsualAddressVC ()
@property (nonatomic, strong) ModelBaseData *modelCompanyName;
@property (nonatomic, strong) ModelBaseData *modelName;
@property (nonatomic, strong) ModelBaseData *modelPhone;
@property (nonatomic, strong) ModelBaseData *modelAddress;
@property (nonatomic, strong) ModelBaseData *modelAddressDetail;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation EditUsualAddressVC

#pragma mark lazy init

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor clearColor];
        _bottomView.widthHeight = XY(SCREEN_WIDTH, W(86));
        [_bottomView addSubview:^(){
            UIView * viewWhite = [UIView new];
            viewWhite.backgroundColor = [UIColor whiteColor];
            viewWhite.frame = CGRectMake(0, W(30), SCREEN_WIDTH, W(56));
            
            UILabel * label = [UILabel new];
            label.textColor = COLOR_RED;
            label.fontNum = F(16);
            [label fitTitle:@"删除地址" variable:0];
            label.centerXCenterY = XY(SCREEN_WIDTH/2.0, viewWhite.height/2.0);
            [viewWhite addSubview:label];
            return viewWhite;
        }()];
        [_bottomView addTarget:self action:@selector(deleteClick)];
    }
    return _bottomView;
}
- (ModelBaseData *)modelCompanyName{
    if (!_modelCompanyName) {
        _modelCompanyName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"单位名称";
            model.subString = self.modelUsualAddress.entName;
            model.placeHolderString = @"填写单位名称";
            return model;
        }();
    }
    return _modelCompanyName;
}
- (ModelBaseData *)modelName{
    if (!_modelName) {
        _modelName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系人";
            model.subString = self.modelUsualAddress.contact;
            model.placeHolderString = @"填写联系人姓名";
            return model;
        }();
    }
    return _modelName;
}
- (ModelBaseData *)modelPhone{
    if (!_modelPhone) {
        _modelPhone = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系电话";
            model.subString = self.modelUsualAddress.phone;
            model.placeHolderString = @"填写联系人电话";
            return model;
        }();
    }
    return _modelPhone;
}
- (ModelBaseData *)modelAddress{
    if (!_modelAddress) {
        _modelAddress =[ModelBaseData new];
        _modelAddress.enumType = ENUM_PERFECT_CELL_SELECT;
        _modelAddress.imageName = @"";
        _modelAddress.string = @"所在地区";
        _modelAddress.placeHolderString = @"选择所在地区";
        _modelAddress.subString = self.modelUsualAddress.provinceShow;
        _modelAddress.identifier = strDotF(self.modelUsualAddress.addressIDShow);
        _modelAddress.hideSubState = true;
        WEAKSELF
        _modelAddress.blocClick = ^(ModelBaseData *model) {
            [GlobalMethod endEditing];
            SelectDistrictView * selectView = [SelectDistrictView new];
            selectView.blockCitySeleted = ^(ModelProvince *pro, ModelProvince *city, ModelProvince *area) {
                weakSelf.modelAddress.subString = [NSString stringWithFormat:@"%@%@%@",pro.name,[pro.name isEqualToString:city.name]?@"":city.name,area.name];
                weakSelf.modelAddress.identifier = strDotF(area.value);
                [weakSelf configData];
            };
            [weakSelf.view addSubview:selectView];
            
        };
    }
    return _modelAddress;
}
- (ModelBaseData *)modelAddressDetail{
    if (!_modelAddressDetail) {
        _modelAddressDetail = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_ADDRESS;
            model.string = @"详细地址";
            model.subString = self.modelUsualAddress.detailAddr;
            model.placeHolderString = @"输入详细地址";
            return model;
        }();
    }
    return _modelAddressDetail;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    //table
    //    self.tableView.tableHeaderView = self.topView;
    self.tableView.backgroundColor = COLOR_BACKGROUND;
    if (self.modelUsualAddress) {
        self.tableView.tableFooterView = self.bottomView;
    }
    [self registAuthorityCell];
    self.tableView.contentInset = UIEdgeInsetsMake(W(10), 0, 0, 0);
    //config data
    [self configData];
    //add keyboard observe
    [self addObserveOfKeyboard];
}

#pragma mark 添加导航栏
- (void)addNav{
    WEAKSELF
    BaseNavView *nav = [BaseNavView initNavBackTitle:self.modelUsualAddress?@"编辑地址":@"添加新地址" rightTitle:@"保存" rightBlock:^{
        [weakSelf navRightClick];
    }];
    [self.view addSubview:nav];
}

#pragma mark config data
- (void)configData{
    
    self.aryDatas = @[ self.modelCompanyName,self.modelName,self.modelPhone,self.modelAddress,self.modelAddressDetail].mutableCopy;
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self dequeueAuthorityCell:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self fetchAuthorityCellHeight:indexPath];
}
#pragma mark click
- (void)deleteClick{
    WEAKSELF
    ModelBtn * modelConfirm = [ModelBtn modelWithTitle:@"确认" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_ORANGE];
    modelConfirm.blockClick = ^{
        [weakSelf requestDelete];
    };
    ModelBtn * modelCancel = [ModelBtn modelWithTitle:@"取消" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_333];
    [BaseAlertView initWithTitle:@"提示" content:@"确认要删除地址？" aryBtnModels:@[modelCancel,modelConfirm] viewShow:[UIApplication sharedApplication].keyWindow];
}
#pragma mark request
- (void)navRightClick{
    if (!self.modelCompanyName.subString) {
        [GlobalMethod showAlert:@"请填写单位名称"];
        return;
    }
    if (!self.modelName.subString) {
        [GlobalMethod showAlert:@"请填写联系人姓名"];
        return;
    }
    if (!self.modelPhone.subString) {
        [GlobalMethod showAlert:@"请填写联系人电话"];
        return;
    }
    if (!self.modelAddress.identifier.doubleValue) {
        [GlobalMethod showAlert:@"请选择所在地区"];
        return;
    }
    if (!self.modelAddressDetail.subString) {
        [GlobalMethod showAlert:@"请输入详细地址"];
        return;
    }
    if (![GlobalMethod isMobileNumber:self.modelPhone.subString]) {
        [GlobalMethod showAlert:@"请输入有效手机号"];
        return;
    }
    
    //判断数据为空
    if (self.modelUsualAddress) {
        [self requestEdit];
    }else{
        [self requestAdd];
    }
}

- (void)requestAdd{
    [RequestApi requestAddUsualAddressWithLng:nil type:1 entId:[GlobalData sharedInstance].GB_CompanyModel.iDProperty townId:self.modelAddress.identifier.doubleValue phone:self.modelPhone.subString contact:self.modelName.subString detailAddr:self.modelAddressDetail.subString entName:self.modelCompanyName.subString lat:nil delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.requestState = 1;
        [GlobalMethod showAlert:@"添加成功"];
        [GB_Nav popViewControllerAnimated:true];

    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
- (void)requestEdit{
    [RequestApi requestUpdateUsualAddressWithLng:nil type:1 entId:[GlobalData sharedInstance].GB_CompanyModel.iDProperty townId:self.modelAddress.identifier.doubleValue phone:self.modelPhone.subString contact:self.modelName.subString detailAddr:self.modelAddressDetail.subString entName:self.modelCompanyName.subString lat:nil id:strDotF(self.modelUsualAddress.iDProperty) delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.requestState = 1;
        [GlobalMethod showAlert:@"修改成功"];
        [GB_Nav popViewControllerAnimated:true];

    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
- (void)requestDelete{
    [RequestApi requestDeleteUsuslAddressWithId:self.modelUsualAddress.iDProperty entId:[GlobalData sharedInstance].GB_CompanyModel.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.requestState = 1;
        [GlobalMethod showAlert:@"删除成功"];
        [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
@end


