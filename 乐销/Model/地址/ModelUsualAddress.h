//
//  ModelUsualAddress.h
//
//  Created by 林栋 隋 on 2019/12/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelUsualAddress : NSObject

@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *entName;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *detailAddr;
@property (nonatomic, assign) double dataState;
@property (nonatomic, assign) double gmtCreate;
@property (nonatomic, strong) NSString *countyName;
@property (nonatomic, assign) double countyId;
@property (nonatomic, assign) double townId;
@property (nonatomic, assign) double lat;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *townName;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, assign) double entId;
@property (nonatomic, assign) double lng;
@property (nonatomic, assign) double provinceId;
@property (nonatomic, assign) double cityId;

//logical
@property (nonatomic, strong) NSString *addressShow;
@property (nonatomic, strong) NSString *provinceShow;
@property (nonatomic, assign) double addressIDShow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
