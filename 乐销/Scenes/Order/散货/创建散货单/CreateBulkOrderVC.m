//
//  CreateBulkOrderVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/6.
//Copyright © 2019 ping. All rights reserved.
//

#import "CreateBulkOrderVC.h"
//keyboard observe
#import "BaseTableVC+KeyboardObserve.h"
#import "BaseVC+BaseImageSelectVC.h"
#import "BaseTableVC+Authority.h"
#import "BaseNavView+Logical.h"
// SelectCarTeamVC
#import "SelectCarTeamVC.h"
//select date
#import "DatePicker.h"
//list view
#import "ListAlertView.h"
//up image
#import "AliClient.h"
//cell
#import "CreateBulkOrderCell.h"
//select address view
#import "SelectDistrictView.h"
//select address vc
#import "UsualAddressVC.h"

@interface CreateBulkOrderVC ()
//发货
@property (nonatomic, strong) ModelBaseData *sendAddress;
@property (nonatomic, strong) ModelBaseData *sendAddressDetail;
@property (nonatomic, strong) ModelBaseData *sendContactName;
@property (nonatomic, strong) ModelBaseData *sendPhone;
@property (nonatomic, strong) ModelBaseData *sendTime;
//收货
@property (nonatomic, strong) ModelBaseData *endAddress;
@property (nonatomic, strong) ModelBaseData *endAddressDetail;
@property (nonatomic, strong) ModelBaseData *endCompanyName;
@property (nonatomic, strong) ModelBaseData *endContactName;
@property (nonatomic, strong) ModelBaseData *endPhone;
@property (nonatomic, strong) ModelBaseData *endTime;
//货物
@property (nonatomic, strong) ModelBaseData *goodsName;
@property (nonatomic, strong) ModelBaseData *goodsPrice;
@property (nonatomic, strong) ModelBaseData *goodsWeight;
//车辆
@property (nonatomic, strong) ModelBaseData *carName;
@property (nonatomic, strong) ModelBaseData *driverName;
@property (nonatomic, strong) ModelBaseData *driverPhone;
//备注
@property (nonatomic, strong) ModelBaseData *remark;

@end

@implementation CreateBulkOrderVC

#pragma mark lazy init
#pragma mark 懒加载
- (ModelBaseData *)sendAddress{
    if (!_sendAddress) {
        _sendAddress = ^(){
            WEAKSELF
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_SELECT;
            model.imageName = @"";
            model.string = @"发货地";
            model.hideSubState = true;
            model.placeHolderString = @"选择发货地 (必选)";
            model.blocClick = ^(ModelBaseData *model) {
                [GlobalMethod endEditing];
                SelectDistrictView * selectView = [SelectDistrictView new];
                selectView.blockCitySeleted = ^(ModelProvince *pro, ModelProvince *city, ModelProvince *area) {
                    weakSelf.sendAddress.subString = [NSString stringWithFormat:@"%@%@%@",pro.name,[pro.name isEqualToString:city.name]?@"":city.name,area.name];
                    weakSelf.sendAddress.identifier = strDotF(area.value);
                    [weakSelf configData];
                };
                [weakSelf.view addSubview:selectView];
            };
            return model;
        }();
    }
    return _sendAddress;
}
- (ModelBaseData *)sendAddressDetail{
    if (!_sendAddressDetail) {
        _sendAddressDetail = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"详细地址";
            model.placeHolderString = @"输入详细地址 (必填)";
            return model;
        }();
    }
    return _sendAddressDetail;
}
- (ModelBaseData *)sendContactName{
    if (!_sendContactName) {
        _sendContactName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系人";
            model.placeHolderString = @"输入发货联系人姓名";
            return model;
        }();
    }
    return _sendContactName;
}
- (ModelBaseData *)sendPhone{
    if (!_sendPhone) {
        _sendPhone = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系电话";
            model.placeHolderString = @"输入发货联系人电话";
            return model;
        }();
    }
    return _sendPhone;
}
- (ModelBaseData *)sendTime{
    if (!_sendTime) {
        _sendTime = ^(){
            WEAKSELF
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_SELECT;
            model.imageName = @"";
            model.string = @"发货时间";
            model.hideSubState = true;
            model.hideState = true;
            model.placeHolderString = @"选择发货时间 (必选)";
            model.blocClick = ^(ModelBaseData *item) {
                [GlobalMethod endEditing];
                DatePicker * datePickerView = [DatePicker initWithMinDate:[GlobalMethod exchangeStringToDate:@"1900" formatter:@"yyyy"] dateSelectBlock:^(NSDate *date) {
                    weakSelf.sendTime.subString = [GlobalMethod exchangeDate:date formatter:TIME_MIN_CN];
                    [weakSelf configData];
                } type:ENUM_PICKER_DATE_YEAR_MONTH_DAY_HOUR_MIN];
                [datePickerView.datePicker selectDate:isStr(weakSelf.sendTime.subString)?[GlobalMethod exchangeStringToDate:weakSelf.sendTime.subString formatter:TIME_MIN_CN]:[NSDate date]];
                [weakSelf.view addSubview:datePickerView];
            };
            return model;
        }();
    }
    return _sendTime;
}
- (ModelBaseData *)endAddress{
    if (!_endAddress) {
        _endAddress = ^(){
            WEAKSELF
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_SELECT;
            model.imageName = @"";
            model.string = @"收货地";
            model.hideSubState = true;
            model.placeHolderString = @"选择收货地 (必选)";
            model.blocClick = ^(ModelBaseData *model) {
                [GlobalMethod endEditing];
                SelectDistrictView * selectView = [SelectDistrictView new];
                selectView.blockCitySeleted = ^(ModelProvince *pro, ModelProvince *city, ModelProvince *area) {
                    weakSelf.endAddress.subString = [NSString stringWithFormat:@"%@%@%@",pro.name,[pro.name isEqualToString:city.name]?@"":city.name,area.name];
                    weakSelf.endAddress.identifier = strDotF(area.value);
                    [weakSelf configData];
                };
                [weakSelf.view addSubview:selectView];
            };
            return model;
        }();
    }
    return _endAddress;
}
- (ModelBaseData *)endAddressDetail{
    if (!_endAddressDetail) {
        _endAddressDetail = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"详细地址";
            model.placeHolderString = @"输入详细地址 (必填)";
            return model;
        }();
    }
    return _endAddressDetail;
}
- (ModelBaseData *)endCompanyName{
    if (!_endCompanyName) {
        _endCompanyName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"收货企业";
            model.placeHolderString = @"输入收货企业名称 (必填)";
            return model;
        }();
    }
    return _endCompanyName;
}
- (ModelBaseData *)endContactName{
    if (!_endContactName) {
        _endContactName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系人";
            model.placeHolderString = @"输入收货联系人姓名";
            return model;
        }();
    }
    return _endContactName;
}
- (ModelBaseData *)endPhone{
    if (!_endPhone) {
        _endPhone = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"联系电话";
            model.placeHolderString = @"输入发货联系人电话";
            return model;
        }();
    }
    return _endPhone;
}
- (ModelBaseData *)endTime{
    if (!_endTime) {
        _endTime = ^(){
            WEAKSELF
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_SELECT;
            model.imageName = @"";
            model.string = @"收货时间";
            model.hideSubState = true;
            model.hideState = true;
            model.placeHolderString = @"选择截止收货时间 (必选)";
            model.blocClick = ^(ModelBaseData *item) {
                [GlobalMethod endEditing];
                DatePicker * datePickerView = [DatePicker initWithMinDate:[GlobalMethod exchangeStringToDate:@"1900" formatter:@"yyyy"] dateSelectBlock:^(NSDate *date) {
                    weakSelf.endTime.subString = [GlobalMethod exchangeDate:date formatter:TIME_MIN_CN];
                    [weakSelf configData];
                } type:ENUM_PICKER_DATE_YEAR_MONTH_DAY_HOUR_MIN];
                [datePickerView.datePicker selectDate:isStr(weakSelf.endTime.subString)?[GlobalMethod exchangeStringToDate:weakSelf.endTime.subString formatter:TIME_MIN_CN]:[NSDate date]];
                [weakSelf.view addSubview:datePickerView];
            };
            return model;
        }();
    }
    return _endTime;
}
- (ModelBaseData *)goodsName{
    if (!_goodsName) {
        _goodsName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"货物名称";
            model.placeHolderString = @"输入货物名称 (必填)";
            return model;
        }();
    }
    return _goodsName;
}
- (ModelBaseData *)goodsPrice{
    if (!_goodsPrice) {
        _goodsPrice = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"运单费用";
            model.identifier = @"元";
            model.hideSubState = true;
            model.placeHolderString = @"输入运单费用 (必填)";
            return model;
        }();
    }
    return _goodsPrice;
}
- (ModelBaseData *)goodsWeight{
    if (!_goodsWeight) {
        _goodsWeight = ^(){
            WEAKSELF
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"发货量";
            model.identifier = @"车";
            model.hideState = true;
            model.hideSubState = false;
            model.placeHolderString = @"输入发货量 (必填)";
            model.blocClick = ^(ModelBaseData *item) {
                ListAlertView * listNew = [ListAlertView new];
                NSArray * aryDateTypes = @[@"车",@"吨",@"立方米"];
                for (CreateBulkOrderCell * cell in weakSelf.tableView.visibleCells) {
                    if ([cell isKindOfClass:[CreateBulkOrderCell class]] && [cell.model.string isEqualToString: weakSelf.goodsWeight.string]) {
                        CGPoint point = [weakSelf.tableView convertPoint:CGPointMake(0, CGRectGetMaxY(cell.frame)) toView:[UIApplication sharedApplication].keyWindow] ;
                        if (SCREEN_HEIGHT - point.y > W(250)) {
                            [listNew showWithPoint:CGPointMake(SCREEN_WIDTH - W(86)-W(10), point.y-W(10))  width: W(86) ary:aryDateTypes];
                        }else{
                            CGPoint pointOrigin = weakSelf.tableView.contentOffset;
                            [weakSelf.tableView setContentOffset:CGPointMake(0, pointOrigin.y -(SCREEN_HEIGHT - point.y - W(250))-W(10)) animated:true];
                            [listNew showWithPoint:CGPointMake(SCREEN_WIDTH - W(86)-W(10), SCREEN_HEIGHT - W(250))  width: W(86) ary:aryDateTypes];
                        }
                        listNew.alpha = 0;
                        [UIView animateWithDuration:0.3 animations:^{
                            listNew.alpha = 1;
                        }];
                        break;
                    }
                }
                listNew.blockSelected = ^(NSInteger index) {
                    weakSelf.goodsWeight.identifier = aryDateTypes[index];
                    [weakSelf.tableView reloadData];
                };
            };
            return model;
        }();
    }
    return _goodsWeight;
}
- (ModelBaseData *)carName{
    if (!_carName) {
        _carName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_SELECT;
            model.imageName = @"";
            model.string = @"选择车辆";
            model.hideSubState = true;
            model.placeHolderString = @"选择车辆 (必选)";
            WEAKSELF
            model.blocClick = ^(ModelBaseData *modelClick) {
                [GlobalMethod endEditing];
                SelectCarTeamVC * selectVC = [SelectCarTeamVC new];
                selectVC.blockSelected = ^(ModelCarTeam *modelCarTeamSeleted,ModelCar *modelDriverSelected) {
                    weakSelf.carName.subString = modelDriverSelected.vehicleNumber;
                    weakSelf.carName.identifier = strDotF(modelDriverSelected.iDProperty);
                    weakSelf.driverName.subString = modelDriverSelected.name;
                    weakSelf.driverPhone.subString = modelDriverSelected.driverPhone;
                    [weakSelf configData];
                };
                [GB_Nav pushViewController:selectVC animated:true];
            };
            return model;
        }();
    }
    return _carName;
}
- (ModelBaseData *)driverName{
    if (!_driverName) {
        _driverName = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"司机姓名";
            model.placeHolderString = @"司机姓名";
            model.isChangeInvalid = true;
            return model;
        }();
    }
    return _driverName;
}
- (ModelBaseData *)driverPhone{
    if (!_driverPhone) {
        _driverPhone = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXT;
            model.imageName = @"";
            model.string = @"司机电话";
            model.placeHolderString = @"输入司机电话 (必填)";
            model.hideState = true;
            return model;
        }();
    }
    return _driverPhone;
}
- (ModelBaseData *)remark{
    if (!_remark) {
        _remark = ^(){
            ModelBaseData * model = [ModelBaseData new];
            model.enumType = ENUM_PERFECT_CELL_TEXTVIEW;
            model.imageName = @"";
            model.string = @"";
            model.placeHolderString = @"输入备注内容";
            return model;
        }();
    }
    return _remark;
}


#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    //table
    //    self.tableView.tableHeaderView = self.topView;
    self.tableView.backgroundColor = COLOR_BACKGROUND;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, W(10), 0);
    [self.tableView registerClass:[CreateBulkOrderCell class] forCellReuseIdentifier:@"CreateBulkOrderCell"];
    [self registAuthorityCell];
    
    //config data
    [self configData];
    //add keyboard observe
    [self addObserveOfKeyboard];
}

#pragma mark 添加导航栏
- (void)addNav{
    WEAKSELF
    BaseNavView *nav = [BaseNavView initNavBackTitle:@"发布运单" rightTitle:@"确认发布" rightBlock:^{
        [weakSelf requestAdd];
    }];
    [self.view addSubview:nav];
}

#pragma mark config data
- (void)configData{
   WEAKSELF
    self.aryDatas = @[^(){
        ModelBaseData * model = [ModelBaseData new];
        model.enumType = ENUM_PERFECT_CELL_EMPTY;
        model.imageName = @"";
        model.string = @"发货信息";
        model.isSelected = true;
        model.subString = @"常用地址";
        model.blocClick = ^(ModelBaseData *item) {
            UsualAddressVC * usual = [UsualAddressVC new];
            usual.blockSelected = ^(ModelUsualAddress *modelUsualAddress) {
                weakSelf.sendAddress.subString = modelUsualAddress.provinceShow;
                weakSelf.sendAddress.identifier = strF(modelUsualAddress.addressIDShow);
                weakSelf.sendAddressDetail.subString = modelUsualAddress.detailAddr;
                weakSelf.sendContactName.subString = modelUsualAddress.contact;
                weakSelf.sendPhone.subString = modelUsualAddress.phone;
                [weakSelf configData];
            };
            [GB_Nav pushViewController:usual animated:true];
        };
        return model;
    }(),self.sendAddress,
                       self.sendAddressDetail,
                       self.sendContactName,
                       self.sendPhone,
                       self.sendTime,
                       ^(){
                           ModelBaseData * model = [ModelBaseData new];
                           model.enumType = ENUM_PERFECT_CELL_EMPTY;
                           model.imageName = @"";
                           model.string = @"收货信息";
                           model.isSelected = true;
                           model.subString = @"常用地址";
                           model.blocClick = ^(ModelBaseData *item) {
                               UsualAddressVC * usual = [UsualAddressVC new];
                               usual.blockSelected = ^(ModelUsualAddress *modelUsualAddress) {
                                   weakSelf.endAddress.subString = modelUsualAddress.provinceShow;
                                   weakSelf.endAddress.identifier = strF(modelUsualAddress.addressIDShow);
                                   weakSelf.endAddressDetail.subString = modelUsualAddress.detailAddr;
                                   weakSelf.endContactName.subString = modelUsualAddress.contact;
                                   weakSelf.endPhone.subString = modelUsualAddress.phone;
                                   weakSelf.endCompanyName.subString = modelUsualAddress.entName;
                                   [weakSelf configData];
                               };
                               [GB_Nav pushViewController:usual animated:true];
                           };
                           return model;
                       }(),
                       self.endAddress,
                       self.endAddressDetail,
                       self.endCompanyName,
                       self.endContactName,
                       self.endPhone,
                       self.endTime,
                       ^(){
                           ModelBaseData * model = [ModelBaseData new];
                           model.enumType = ENUM_PERFECT_CELL_EMPTY;
                           model.imageName = @"";
                           model.string = @"货物信息";
                           model.isSelected = true;
                           return model;
                       }(),
                       self.goodsName,
                       self.goodsPrice,
                       self.goodsWeight,
                       ^(){
                           ModelBaseData * model = [ModelBaseData new];
                           model.enumType = ENUM_PERFECT_CELL_EMPTY;
                           model.imageName = @"";
                           model.string = @"车辆信息";
                           return model;
                       }(),
                       self.carName,
                       self.driverName,
                       self.driverPhone,
                       ^(){
                           ModelBaseData * model = [ModelBaseData new];
                           model.enumType = ENUM_PERFECT_CELL_EMPTY;
                           model.imageName = @"";
                           model.string = @"备注信息";
                           model.isSelected = true;
                           return model;
                       }(),
                       self.remark].mutableCopy;
    [self.tableView reloadData];
    
}
#pragma mark image select
- (void)imageSelect:(BaseImage *)image{
}
#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ModelBaseData * model = self.aryDatas[indexPath.row];
    if ([model.string isEqualToString:@"运单费用"]||[model.string isEqualToString:@"发货量"]) {
        CreateBulkOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CreateBulkOrderCell"];
        [cell resetCellWithModel:model];
        return cell;
    }
    return [self dequeueAuthorityCell:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self fetchAuthorityCellHeight:indexPath];
}


#pragma mark request
- (void)requestAdd{
    //判断是否为空
    if (!self.sendAddress.identifier.doubleValue) {
        [GlobalMethod showAlert:@"请选择发货地"];
        return;
    }
    if (!self.sendAddressDetail.subString) {
        [GlobalMethod showAlert:@"请输入发货详细地址"];
        return;
    }
    if (!self.sendTime.subString) {
        [GlobalMethod showAlert:@"请选择发货时间"];
        return;
    }
    if (!self.endAddress.identifier.doubleValue) {
        [GlobalMethod showAlert:@"请选择收货地"];
        return;
    }
    if (!self.endAddressDetail.subString) {
        [GlobalMethod showAlert:@"请输入收货详细地址"];
        return;
    }
    if (!self.endCompanyName.subString) {
        [GlobalMethod showAlert:@"请输入收货企业名称"];
        return;
    }
    if (!self.endTime.subString) {
        [GlobalMethod showAlert:@"请选择收货时间"];
        return;
    }
   
    if (!self.goodsName.subString) {
        [GlobalMethod showAlert:@"请输入货物名称"];
        return;
    }
    if (!self.goodsPrice.subString) {
        [GlobalMethod showAlert:@"请输入运单费用"];
        return;
    }
    if (!self.goodsWeight.subString) {
        [GlobalMethod showAlert:@"请输入发货量"];
        return;
    }
    if (!self.carName.identifier.doubleValue) {
        [GlobalMethod showAlert:@"请选择车辆"];
        return;
    }
    if (!self.driverPhone.subString) {
        [GlobalMethod showAlert:@"请输入司机电话"];
        return;
    }

    
    NSDate * dateEnd = [GlobalMethod exchangeStringToDate:self.endTime.subString formatter:TIME_MIN_CN];
    NSDate * dateStart = [GlobalMethod exchangeStringToDate:self.sendTime.subString formatter:TIME_MIN_CN];

    [RequestApi requestAddBulkOrderWithEndtime:[dateEnd timeIntervalSince1970]
                                     endTownId:self.endAddress.identifier.doubleValue
                                       endAddr:self.endAddressDetail.subString
                                         price:self.goodsPrice.subString.doubleValue*100.0
                                     startAddr:self.sendAddressDetail.subString
                                  shipperPhone:self.sendPhone.subString
                                      endPhone:self.endPhone.subString
                                     startTime:[dateStart timeIntervalSince1970]
                                     cargoName:self.goodsName.subString
                                  startContact:self.sendContactName.subString
                                   description:self.remark.subString
                                   startTownId:self.sendAddress.identifier.doubleValue
                                    startPhone:self.sendPhone.subString
                                    endContact:self.endContactName.subString
                                    fleetPhone:nil
                                    actualLoad:self.goodsWeight.subString.doubleValue
                                   driverPhone:self.driverPhone.subString
                                      loadUnit:self.goodsWeight.identifier
                                     vehicleId:self.carName.identifier.doubleValue
                                         entId:[GlobalData sharedInstance].GB_CompanyModel.iDProperty
                                    endEntName:self.endCompanyName.subString
                                paymentChannel:0
                                 paymentMethod:0
                                      startlat:0
                                      startlng:0
                                        endlat:0
                                        endlng:0 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
                                            self.requestState = 1;
                                            [GlobalMethod showAlert:@"下单成功"];
                                            [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
  
    
}


@end
