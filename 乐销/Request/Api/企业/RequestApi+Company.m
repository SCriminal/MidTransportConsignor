//
//  RequestApi+Company.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/5/27.
//  Copyright © 2019 ping. All rights reserved.
//

#import "RequestApi+Company.h"

@implementation RequestApi (Company)

/**
 企业列表（用户）
 */
+(void)requestCompanyListWithDelegate:(id <RequestDelegate>)delegate
                              success:(void (^)(NSDictionary * response, id mark))success
                              failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{};
    [self getUrl:@"/zhongcheyun/ent/list/option" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 企业详情
 */
+(void)requestCompanyDetailWithId:(double)identity
                         delegate:(id <RequestDelegate>)delegate
                          success:(void (^)(NSDictionary * response, id mark))success
                          failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity)};
    [self getUrl:@"/zhongcheyun/ent/{id}" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 审核记录列表
 */
+(void)requestAuthorityRecordListWithEntid:(double)entId
                                  delegate:(id <RequestDelegate>)delegate
                                   success:(void (^)(NSDictionary * response, id mark))success
                                   failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/ent/qualification/list" delegate:delegate parameters:dic success:success failure:failure];
}


/**
 删除车辆
 */
+(void)requestDeleteCarWithId:(double)identity
                        entId:(double)entId
                     delegate:(id <RequestDelegate>)delegate
                      success:(void (^)(NSDictionary * response, id mark))success
                      failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self deleteUrl:@"/zhongcheyun/vehicle/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 车辆详情
 */
+(void)requestCarDetailWithId:(double)identity
                        entId:(double)entId
                     delegate:(id <RequestDelegate>)delegate
                      success:(void (^)(NSDictionary * response, id mark))success
                      failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/vehicle/1_0_10/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 新增车辆
 */
+(void)requestAddCarWithVin:(NSString *)vin
               engineNumber:(NSString *)engineNumber
              vehicleNumber:(NSString *)vehicleNumber
                licenceType:(double)licenceType
                   driverId:(double)driverId
                driverPhone:(NSString *)driverPhone
                      entId:(double)entId
              trailerNumber:(NSString *)trailerNumber
             vehicleLicense:(NSString *)vehicleLicense
              vehicleLength:(double)vehicleLength
                vehicleType:(double)vehicleType
                vehicleLoad:(double)vehicleLoad
                       axle:(double)axle
               vehicleOwner:(NSString *)vehicleOwner
     drivingLicenseFrontUrl:(NSString *)drivingLicenseFrontUrl
  drivingLicenseNegativeUrl:(NSString *)drivingLicenseNegativeUrl
        vehicleInsuranceUrl:(NSString *)vehicleInsuranceUrl
vehicleTripartiteInsuranceUrl:(NSString *)vehicleTripartiteInsuranceUrl
        trailerInsuranceUrl:(NSString *)trailerInsuranceUrl
trailerTripartiteInsuranceUrl:(NSString *)trailerTripartiteInsuranceUrl
   trailerGoodsInsuranceUrl:(NSString *)trailerGoodsInsuranceUrl
            vehiclePhotoUrl:(NSString *)vehiclePhotoUrl
       managementLicenseUrl:(NSString *)managementLicenseUrl
                   delegate:(id <RequestDelegate>)delegate
                    success:(void (^)(NSDictionary * response, id mark))success
                    failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"vin":RequestStrKey(vin),
                          @"engineNumber":RequestStrKey(engineNumber),
                          @"vehicleNumber":RequestStrKey(vehicleNumber),
                          @"licenceType":NSNumber.dou(licenceType),
                          @"driverId":NSNumber.dou(driverId),
                          @"driverPhone":RequestStrKey(driverPhone),
                          @"entId":NSNumber.dou(entId),
                          @"trailerNumber":RequestStrKey(trailerNumber),
                          @"vehicleLicense":RequestStrKey(vehicleLicense),
                          @"vehicleLength":NSNumber.dou(vehicleLength),
                          @"vehicleType":NSNumber.dou(vehicleType),
                          @"vehicleLoad":NSNumber.dou(vehicleLoad),
                          @"axle":NSNumber.dou(axle),
                          @"vehicleOwner":RequestStrKey(vehicleOwner),
                          @"drivingLicenseFrontUrl":RequestStrKey(drivingLicenseFrontUrl),
                          @"drivingLicenseNegativeUrl":RequestStrKey(drivingLicenseNegativeUrl),
                          @"vehicleInsuranceUrl":RequestStrKey(vehicleInsuranceUrl),
                          @"vehicleTripartiteInsuranceUrl":RequestStrKey(vehicleTripartiteInsuranceUrl),
                          @"trailerInsuranceUrl":RequestStrKey(trailerInsuranceUrl),
                          @"trailerTripartiteInsuranceUrl":RequestStrKey(trailerTripartiteInsuranceUrl),
                          @"trailerGoodsInsuranceUrl":RequestStrKey(trailerGoodsInsuranceUrl),
                          @"vehiclePhotoUrl":RequestStrKey(vehiclePhotoUrl),
                          @"managementLicenseUrl":RequestStrKey(managementLicenseUrl),
                          };
    [self postUrl:@"/zhongcheyun/vehicle/1_0_10" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 编辑车辆
 */
+(void)requestEditCarWithVin:(NSString *)vin
                engineNumber:(NSString *)engineNumber
               vehicleNumber:(NSString *)vehicleNumber
                 licenceType:(double)licenceType
                    driverId:(NSString *)driverId
                 driverPhone:(NSString *)driverPhone
                registerDate:(double)registerDate
                   issueDate:(double)issueDate
                       entId:(double)entId
               trailerNumber:(NSString *)trailerNumber
              vehicleLicense:(NSString *)vehicleLicense
               vehicleLength:(double)vehicleLength
                 vehicleType:(double)vehicleType
                 vehicleLoad:(double)vehicleLoad
                        axle:(double)axle
                          id:(double)identity
                vehicleOwner:(NSString *)vehicleOwner
      drivingLicenseFrontUrl:(NSString *)drivingLicenseFrontUrl
   drivingLicenseNegativeUrl:(NSString *)drivingLicenseNegativeUrl
         vehicleInsuranceUrl:(NSString *)vehicleInsuranceUrl
vehicleTripartiteInsuranceUrl:(NSString *)vehicleTripartiteInsuranceUrl
         trailerInsuranceUrl:(NSString *)trailerInsuranceUrl
trailerTripartiteInsuranceUrl:(NSString *)trailerTripartiteInsuranceUrl
    trailerGoodsInsuranceUrl:(NSString *)trailerGoodsInsuranceUrl
             vehiclePhotoUrl:(NSString *)vehiclePhotoUrl
        managementLicenseUrl:(NSString *)managementLicenseUrl
                    delegate:(id <RequestDelegate>)delegate
                     success:(void (^)(NSDictionary * response, id mark))success
                     failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"vin":RequestStrKey(vin),
                          @"engineNumber":RequestStrKey(engineNumber),
                          @"vehicleNumber":RequestStrKey(vehicleNumber),
                          @"licenceType":NSNumber.dou(licenceType),
                          @"driverId":RequestStrKey(driverId),
                          @"driverPhone":RequestStrKey(driverPhone),
                          @"registerDate":NSNumber.dou(registerDate),
                          @"issueDate":NSNumber.dou(issueDate),
                          @"entId":NSNumber.dou(entId),
                          @"trailerNumber":RequestStrKey(trailerNumber),
                          @"vehicleLicense":RequestStrKey(vehicleLicense),
                          @"vehicleLength":NSNumber.dou(vehicleLength),
                          @"vehicleType":NSNumber.dou(vehicleType),
                          @"vehicleLoad":NSNumber.dou(vehicleLoad),
                          @"axle":NSNumber.dou(axle),
                          @"id":NSNumber.dou(identity),
                          @"vehicleOwner":RequestStrKey(vehicleOwner),
                          @"drivingLicenseFrontUrl":RequestStrKey(drivingLicenseFrontUrl),
                          @"drivingLicenseNegativeUrl":RequestStrKey(drivingLicenseNegativeUrl),
                          @"vehicleInsuranceUrl":RequestStrKey(vehicleInsuranceUrl),
                          @"vehicleTripartiteInsuranceUrl":RequestStrKey(vehicleTripartiteInsuranceUrl),
                          @"trailerInsuranceUrl":RequestStrKey(trailerInsuranceUrl),
                          @"trailerTripartiteInsuranceUrl":RequestStrKey(trailerTripartiteInsuranceUrl),
                          @"trailerGoodsInsuranceUrl":RequestStrKey(trailerGoodsInsuranceUrl),
                          @"vehiclePhotoUrl":RequestStrKey(vehiclePhotoUrl),
                          @"managementLicenseUrl":RequestStrKey(managementLicenseUrl),
                          };
    [self patchUrl:@"/zhongcheyun/vehicle/1_0_10/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 提交车辆
 */
+(void)requestResubmitCarWithId:(double)identity
                          entId:(double)entId
                       delegate:(id <RequestDelegate>)delegate
                        success:(void (^)(NSDictionary * response, id mark))success
                        failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.lon(entId),
                          @"id":NSNumber.dou(identity),
                          };
    [self patchUrl:@"/zhongcheyun/vehicle/submit/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 车辆列表
 */
+(void)requestCarListWithDrivername:(NSString *)driverName
                        driverPhone:(NSString *)driverPhone
                      vehicleNumber:(NSString *)vehicleNumber
                               page:(double)page
                              count:(double)count
                              entId:(double)entId
                 qualificationState:(double)qualificationState
                           delegate:(id <RequestDelegate>)delegate
                            success:(void (^)(NSDictionary * response, id mark))success
                            failure:(void (^)(NSString * errorStr, id mark))failure{
    NSMutableDictionary *dic = @{@"driverName":RequestStrKey(driverName),
                                 @"driverPhone":RequestStrKey(driverPhone),
                                 @"vehicleNumber":RequestStrKey(vehicleNumber),
                                 @"page":NSNumber.dou(page),
                                 @"count":NSNumber.dou(count),
                                 @"entId":NSNumber.dou(entId),
                                 }.mutableCopy;
    if (qualificationState) {
        [dic setObject:NSNumber.dou(qualificationState) forKey:@"qualificationState"];
    }
    [self getUrl:@"/zhongcheyun/vehicle/list" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 司机列表
 */
+(void)requestDriverListWithEntid:(double)entId
                             page:(double)page
                            count:(double)count
                             name:(NSString *)name
                            phone:(NSString *)phone
                         delegate:(id <RequestDelegate>)delegate
                          success:(void (^)(NSDictionary * response, id mark))success
                          failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId),
                          @"page":NSNumber.dou(page),
                          @"driverName":RequestStrKey(name),
                          @"driverPhone":RequestStrKey(phone),
                          @"count":NSNumber.dou(count)};
    [self getUrl:@"/zhongcheyun/driver/list/total" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 司机列表（审核通过的没有车的）
 */
+(void)requestDriveListPassWithEntid:(double)entId
                                page:(double)page
                               count:(double)count
                            delegate:(id <RequestDelegate>)delegate
                             success:(void (^)(NSDictionary * response, id mark))success
                             failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId),
                          @"page":NSNumber.dou(page),
                          @"count":NSNumber.dou(count)};
    [self getUrl:@"/zhongcheyun/driver/list/pass" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 添加司机
 */
+(void)requestAddDriverWithPhone:(NSString *)phone
                             pwd:(NSString *)pwd
                            name:(NSString *)name
                          idCard:(NSString *)idCard
                           entId:(double)entId
                        bankName:(NSString *)bankName
                     bankAccount:(NSString *)bankAccount
                            addr:(NSString *)addr
                  idCardFrontUrl:(NSString *)idCardFrontUrl
                   idCardBackUrl:(NSString *)idCardBackUrl
                driverLicenseUrl:(NSString *)driverLicenseUrl
                 idCardHandelUrl:(NSString *)idCardHandelUrl
                        delegate:(id <RequestDelegate>)delegate
                         success:(void (^)(NSDictionary * response, id mark))success
                         failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"driverPhone":RequestStrKey(phone),
                          @"pwd":RequestStrKey([pwd base64Encode]),
                          @"driverName":RequestStrKey(name),
                          @"idCard":RequestStrKey(idCard),
                          @"bankName":RequestStrKey(bankName),
                          @"bankAccount":RequestStrKey(bankAccount),
                          @"addr":RequestStrKey(addr),
                          @"entId":NSNumber.dou(entId),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardBackUrl":RequestStrKey(idCardBackUrl),
                          @"driverLicenseUrl":RequestStrKey(driverLicenseUrl),
                          @"idCardHandelUrl":RequestStrKey(idCardHandelUrl),
                          };
    [self postUrl:@"/zhongcheyun/driver/1_0_10" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 编辑司机
 */
+(void)requestEditDriverWithName:(NSString *)name
                          idCard:(NSString *)idCard
                           entId:(double)entId
                              id:(double)identity
                        bankName:(NSString *)bankName
                     bankAccount:(NSString *)bankAccount
                            addr:(NSString *)addr
                  idCardFrontUrl:(NSString *)idCardFrontUrl
                   idCardBackUrl:(NSString *)idCardBackUrl
                driverLicenseUrl:(NSString *)driverLicenseUrl
                 idCardHandelUrl:(NSString *)idCardHandelUrl
                        delegate:(id <RequestDelegate>)delegate
                         success:(void (^)(NSDictionary * response, id mark))success
                         failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{
                          //                          @"driverPhone":RequestStrKey(phone),
                          //                          @"pwd":RequestStrKey(pwd),
                          @"driverName":RequestStrKey(name),
                          @"idCard":RequestStrKey(idCard),
                          @"entId":NSNumber.dou(entId),
                          @"bankName":RequestStrKey(bankName),
                          @"bankAccount":RequestStrKey(bankAccount),
                          @"addr":RequestStrKey(addr),
                          @"id":NSNumber.dou(identity),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardBackUrl":RequestStrKey(idCardBackUrl),
                          @"driverLicenseUrl":RequestStrKey(driverLicenseUrl),
                          @"idCardHandelUrl":RequestStrKey(idCardHandelUrl),
                          };
    [self patchUrl:@"/zhongcheyun/driver/1_0_10/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 删除司机
 */
+(void)requestDeleteDriverWithId:(double)identity
                           entId:(double)entId
                        delegate:(id <RequestDelegate>)delegate
                         success:(void (^)(NSDictionary * response, id mark))success
                         failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self deleteUrl:@"/zhongcheyun/driver/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 司机文件列表
 */
+(void)requestDriveFileListPassWithDriverId:(double)driverId
                                      entId:(double)entId
                                   delegate:(id <RequestDelegate>)delegate
                                    success:(void (^)(NSDictionary * response, id mark))success
                                    failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"driverId":NSNumber.dou(driverId),
                          @"entId":NSNumber.dou(entId)
                          };
    [self getUrl:@"/zhongcheyun/driver/1_0_10/file" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 删除司机（取消挂靠）
 */
+(void)requestCancelAttachedDriverWithId:(double)identity
                                   entId:(double)entId
                                  reason:(NSString *)reason
                                delegate:(id <RequestDelegate>)delegate
                                 success:(void (^)(NSDictionary * response, id mark))success
                                 failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId),
                          @"reason":RequestStrKey(reason)};
    [self deleteUrl:@"/zhongcheyun/driver/1_0_75/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 同意挂靠（车队）（批量）
 */
+(void)requestAdmitAttachApplyWithEntid:(double)entId
                                    ids:(NSString *)ids
                                 reason:(NSString *)reason
                               delegate:(id <RequestDelegate>)delegate
                                success:(void (^)(NSDictionary * response, id mark))success
                                failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId),
                          @"ids":RequestStrKey(ids),
                          @"reason":RequestStrKey(reason)};
    [self patchUrl:@"/zhongcheyun/driverdependent/1_0_75/list/10" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 拒绝挂靠（车队）（批量）
 */
+(void)requestRejectAttachApplyWithEntid:(double)entId
                                     ids:(NSString *)ids
                                  reason:(NSString *)reason
                                delegate:(id <RequestDelegate>)delegate
                                 success:(void (^)(NSDictionary * response, id mark))success
                                 failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId),
                          @"ids":RequestStrKey(ids),
                          @"reason":RequestStrKey(reason)};
    [self patchUrl:@"/zhongcheyun/driverdependent/1_0_75/list/21" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 新增组织（运输公司）（认证文件参数化）
 */
+(void)requestAddTransportCompanyWithLogourl:(NSString *)logoUrl
                             businessLicense:(NSString *)businessLicense
                              identityNumber:(NSString *)identityNumber
                              officeCountyId:(double)officeCountyId
                                   legalName:(NSString *)legalName
                                 officeEmail:(NSString *)officeEmail
                                 officePhone:(NSString *)officePhone
                                        name:(NSString *)name
                            officeAddrDetail:(NSString *)officeAddrDetail
                           managementLicense:(NSString *)managementLicense
                          businessLicenseUrl:(NSString *)businessLicenseUrl
                              idCardFrontUrl:(NSString *)idCardFrontUrl
                           idCardNegativeUrl:(NSString *)idCardNegativeUrl
                        managementLicenseUrl:(NSString *)managementLicenseUrl
                                    delegate:(id <RequestDelegate>)delegate
                                     success:(void (^)(NSDictionary * response, id mark))success
                                     failure:(void (^)(NSString * errorStr, id mark))failure{
    
    NSDictionary *dic = @{@"logoUrl":RequestStrKey(logoUrl),
                          @"businessLicense":RequestStrKey(businessLicense),
                          @"identityNumber":RequestStrKey(identityNumber),
                          @"officeCountyId":NSNumber.dou(officeCountyId),
                          @"legalName":RequestStrKey(legalName),
                          @"officeEmail":RequestStrKey(officeEmail),
                          @"officePhone":RequestStrKey(officePhone),
                          @"name":RequestStrKey(name),
                          @"officeAddrDetail":RequestStrKey(officeAddrDetail),
                          @"businessLicenseUrl":RequestStrKey(businessLicenseUrl),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardNegativeUrl":RequestStrKey(idCardNegativeUrl),
                          @"managementLicenseUrl":RequestStrKey(managementLicenseUrl),                                              @"managementLicense":RequestStrKey(managementLicense)};
    [self postUrl:@"/zhongcheyun/ent/1_0_10/31" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 新增组织（个体车主）（认证文件参数化）
 */
+(void)requestAddSelfCompanyWithBusinesslicense:(NSString *)businessLicense
                                           name:(NSString *)name
                                 idCardFrontUrl:(NSString *)idCardFrontUrl
                              idCardNegativeUrl:(NSString *)idCardNegativeUrl
                              idCardHandheldUrl:(NSString *)idCardHandheldUrl
                               driverLicenseUrl:(NSString *)driverLicenseUrl
                                       delegate:(id <RequestDelegate>)delegate
                                        success:(void (^)(NSDictionary * response, id mark))success
                                        failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"businessLicense":RequestStrKey(businessLicense),
                          @"name":RequestStrKey(name),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardNegativeUrl":RequestStrKey(idCardNegativeUrl),
                          @"idCardHandheldUrl":RequestStrKey(idCardHandheldUrl),                          @"driverLicenseUrl":RequestStrKey(driverLicenseUrl),
                          };
    [self postUrl:@"/zhongcheyun/ent/1_0_10/32" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 审核文件（最新一条审核记录）（认证文件参数化）
 */
+(void)requestAuthorityImageWithEntid:(double)entId
                             delegate:(id <RequestDelegate>)delegate
                              success:(void (^)(NSDictionary * response, id mark))success
                              failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/ent/1_0_10/file" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 审核记录列表
 */
+(void)requestAuthoritySuccessImageWithEntid:(double)entId
                                    delegate:(id <RequestDelegate>)delegate
                                     success:(void (^)(NSDictionary * response, id mark))success
                                     failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/ent/1_0_45/file/3" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 审核失败重新提交（运输公司)
 */
+(void)requestReAddTransportCompanyWithLogourl:(NSString *)logoUrl
                               businessLicense:(NSString *)businessLicense
                                identityNumber:(NSString *)identityNumber
                                officeCountyId:(double)officeCountyId
                                     legalName:(NSString *)legalName
                                   officeEmail:(NSString *)officeEmail
                                   officePhone:(NSString *)officePhone
                                          name:(NSString *)name
                              officeAddrDetail:(NSString *)officeAddrDetail
                             managementLicense:(NSString *)managementLicense
                            businessLicenseUrl:(NSString *)businessLicenseUrl
                                idCardFrontUrl:(NSString *)idCardFrontUrl
                             idCardNegativeUrl:(NSString *)idCardNegativeUrl
                          managementLicenseUrl:(NSString *)managementLicenseUrl
                                            id:(double)identity
                                      delegate:(id <RequestDelegate>)delegate
                                       success:(void (^)(NSDictionary * response, id mark))success
                                       failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"logoUrl":RequestStrKey(logoUrl),
                          @"businessLicense":RequestStrKey(businessLicense),
                          @"identityNumber":RequestStrKey(identityNumber),
                          @"officeCountyId":NSNumber.dou(officeCountyId),
                          @"legalName":RequestStrKey(legalName),
                          @"officeEmail":RequestStrKey(officeEmail),
                          @"officePhone":RequestStrKey(officePhone),
                          @"name":RequestStrKey(name),
                          @"officeAddrDetail":RequestStrKey(officeAddrDetail),
                          @"businessLicenseUrl":RequestStrKey(businessLicenseUrl),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardNegativeUrl":RequestStrKey(idCardNegativeUrl),
                          @"managementLicenseUrl":RequestStrKey(managementLicenseUrl),                      @"managementLicense":RequestStrKey(managementLicense),
                          @"id":NSNumber.dou(identity)};
    [self patchUrl:@"/zhongcheyun/ent/1_0_40/31/{id}" delegate:delegate parameters:dic success:success failure:failure];
}


/**
 重新提交（个体车主）（认证文件参数化）
 */
+(void)requestReAddSelfCompanyWithBusinesslicense:(NSString *)businessLicense
                                             name:(NSString *)name
                                   idCardFrontUrl:(NSString *)idCardFrontUrl
                                idCardNegativeUrl:(NSString *)idCardNegativeUrl
                                idCardHandheldUrl:(NSString *)idCardHandheldUrl
                                 driverLicenseUrl:(NSString *)driverLicenseUrl
                                               id:(double)identity
                                         delegate:(id <RequestDelegate>)delegate
                                          success:(void (^)(NSDictionary * response, id mark))success
                                          failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"businessLicense":RequestStrKey(businessLicense),
                          @"name":RequestStrKey(name),
                          @"idCardFrontUrl":RequestStrKey(idCardFrontUrl),
                          @"idCardNegativeUrl":RequestStrKey(idCardNegativeUrl),
                          @"idCardHandheldUrl":RequestStrKey(idCardHandheldUrl),
                          @"driverLicenseUrl":RequestStrKey(driverLicenseUrl),
                          @"id":NSNumber.dou(identity)};
    [self patchUrl:@"/zhongcheyun/ent/1_0_40/32/{id}" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 挂靠申请列表（车队）
 */
+(void)requestAttachApplyListWithEntid:(double)entId
                             cellPhone:(NSString *)cellPhone
                              realName:(NSString *)realName
                                 state:(NSString *)state
                             startTime:(double)startTime
                               endTime:(double)endTime
                                  page:(double)page
                                 count:(double)count
                              delegate:(id <RequestDelegate>)delegate
                               success:(void (^)(NSDictionary * response, id mark))success
                               failure:(void (^)(NSString * errorStr, id mark))failure{
    NSMutableDictionary *dic = @{@"entId":NSNumber.dou(entId),
                                 @"cellPhone":RequestStrKey(cellPhone),
                                 @"realName":RequestStrKey(realName),
                                 @"state":RequestStrKey(state),
                                 @"page":NSNumber.dou(page),
                                 @"count":NSNumber.dou(count)}.mutableCopy;
    if (startTime) {
        [dic setObject:NSNumber.lon(startTime) forKey: @"startTime"];
    }
    if (endTime) {
        [dic setObject:NSNumber.lon(endTime) forKey: @"endTime"];
    }
    [self getUrl:@"/zhongcheyun/driverdependent/1_0_75/list/fleet/total" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 挂靠详情（车队）
 */
+(void)requestAttachInfoWithId:(double)identity
                         entId:(double)entId
                      delegate:(id <RequestDelegate>)delegate
                       success:(void (^)(NSDictionary * response, id mark))success
                       failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/driverdependent/1_0_75/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 挂靠司机列表（车队）（挂靠）
 */
+(void)requestrequestAttachedDriverListWithEntidWithEntid:(double)entId
                                                     page:(double)page
                                                    count:(double)count
                                               driverName:(NSString *)driverName
                                              driverPhone:(NSString *)driverPhone
                                                 delegate:(id <RequestDelegate>)delegate
                                                  success:(void (^)(NSDictionary * response, id mark))success
                                                  failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId),
                          @"page":NSNumber.dou(page),
                          @"count":NSNumber.dou(count),
                          @"driverName":RequestStrKey(driverName),
                          @"driverPhone":RequestStrKey(driverPhone)};
    [self getUrl:@"/zhongcheyun/driver/1_0_75/list/total" delegate:delegate parameters:dic success:success failure:failure];
}


/**
 常用地址列表(总数)
 */
+(void)requestUsuslAddressListWithId:(double)identity
                                type:(double)type
                          countyName:(NSString *)countyName
                        provinceName:(NSString *)provinceName
                            cityName:(NSString *)cityName
                            countyId:(double)countyId
                               entId:(NSString *)entId
                              townId:(double)townId
                          provinceId:(double)provinceId
                            townName:(NSString *)townName
                              cityId:(double)cityId
                               phone:(NSString *)phone
                             contact:(NSString *)contact
                             entName:(NSString *)entName
                           startTime:(double)startTime
                             endTime:(NSString *)endTime
                                page:(double)page
                               count:(NSString *)count
                          detailAddr:(NSString *)detailAddr
                            delegate:(id <RequestDelegate>)delegate
                             success:(void (^)(NSDictionary * response, id mark))success
                             failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{
//                          @"id":NSNumber.dou(identity),
//                          @"type":NSNumber.dou(type),
//                          @"countyName":RequestStrKey(countyName),
//                          @"provinceName":RequestStrKey(provinceName),
//                          @"cityName":RequestStrKey(cityName),
//                          @"countyId":NSNumber.dou(countyId),
//                          @"townId":NSNumber.dou(townId),
//                          @"provinceId":NSNumber.dou(provinceId),
//                          @"townName":RequestStrKey(townName),
//                          @"cityId":NSNumber.dou(cityId),
//                          @"phone":RequestStrKey(phone),
//                          @"contact":RequestStrKey(contact),
//                          @"entName":RequestStrKey(entName),
//                          @"startTime":NSNumber.dou(startTime),
//                          @"endTime":RequestStrKey(endTime),
//                          @"detailAddr":RequestStrKey(detailAddr),
                          @"entId":RequestStrKey(entId),
                          @"page":NSNumber.dou(page),
                          @"count":RequestStrKey(count)};
    [self getUrl:@"/zhongcheyun/cargohandling/list/total" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 常用地址删除
 */
+(void)requestDeleteUsuslAddressWithId:(double)identity
                                 entId:(double)entId
                              delegate:(id <RequestDelegate>)delegate
                               success:(void (^)(NSDictionary * response, id mark))success
                               failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self deleteUrl:@"/zhongcheyun/cargohandling/{id}" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 添加常用地址
 */
+(void)requestAddUsualAddressWithLng:(NSString *)lng
                                type:(double)type
                               entId:(double)entId
                              townId:(double)townId
                               phone:(NSString *)phone
                             contact:(NSString *)contact
                          detailAddr:(NSString *)detailAddr
                             entName:(NSString *)entName
                                 lat:(NSString *)lat
                            delegate:(id <RequestDelegate>)delegate
                             success:(void (^)(NSDictionary * response, id mark))success
                             failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"lng":RequestStrKey(lng),
                          @"type":NSNumber.dou(type),
                          @"entId":NSNumber.dou(entId),
                          @"townId":NSNumber.dou(townId),
                          @"phone":RequestStrKey(phone),
                          @"contact":RequestStrKey(contact),
                          @"detailAddr":RequestStrKey(detailAddr),
                          @"entName":RequestStrKey(entName),
                          @"lat":RequestStrKey(lat)};
    [self postUrl:@"/zhongcheyun/cargohandling" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 常用地址信息
 */
+(void)requestUpdateUsualAddressWithLng:(NSString *)lng
                                   type:(double)type
                                  entId:(double)entId
                                 townId:(double)townId
                                  phone:(NSString *)phone
                                contact:(NSString *)contact
                             detailAddr:(NSString *)detailAddr
                                entName:(NSString *)entName
                                    lat:(NSString *)lat
                                     id:(NSString *)identity
                               delegate:(id <RequestDelegate>)delegate
                                success:(void (^)(NSDictionary * response, id mark))success
                                failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"lng":RequestStrKey(lng),
                          @"type":NSNumber.dou(type),
                          @"entId":NSNumber.dou(entId),
                          @"townId":NSNumber.dou(townId),
                          @"phone":RequestStrKey(phone),
                          @"contact":RequestStrKey(contact),
                          @"detailAddr":RequestStrKey(detailAddr),
                          @"entName":RequestStrKey(entName),
                          @"lat":RequestStrKey(lat),
                          @"id":RequestStrKey(identity)};
    [self patchUrl:@"/zhongcheyun/cargohandling/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
@end

