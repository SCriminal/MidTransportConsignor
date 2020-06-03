//
//  ModelUsualAddress.m
//
//  Created by 林栋 隋 on 2019/12/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelUsualAddress.h"


NSString *const kModelUsualAddressId = @"id";
NSString *const kModelUsualAddressPhone = @"phone";
NSString *const kModelUsualAddressEntName = @"entName";
NSString *const kModelUsualAddressContact = @"contact";
NSString *const kModelUsualAddressDetailAddr = @"detailAddr";
NSString *const kModelUsualAddressDataState = @"dataState";
NSString *const kModelUsualAddressGmtCreate = @"gmtCreate";
NSString *const kModelUsualAddressCountyName = @"countyName";
NSString *const kModelUsualAddressCountyId = @"countyId";
NSString *const kModelUsualAddressTownId = @"townId";
NSString *const kModelUsualAddressLat = @"lat";
NSString *const kModelUsualAddressCityName = @"cityName";
NSString *const kModelUsualAddressTownName = @"townName";
NSString *const kModelUsualAddressType = @"type";
NSString *const kModelUsualAddressProvinceName = @"provinceName";
NSString *const kModelUsualAddressEntId = @"entId";
NSString *const kModelUsualAddressLng = @"lng";
NSString *const kModelUsualAddressProvinceId = @"provinceId";
NSString *const kModelUsualAddressCityId = @"cityId";


@interface ModelUsualAddress ()
@end

@implementation ModelUsualAddress

@synthesize iDProperty = _iDProperty;
@synthesize phone = _phone;
@synthesize entName = _entName;
@synthesize contact = _contact;
@synthesize detailAddr = _detailAddr;
@synthesize dataState = _dataState;
@synthesize gmtCreate = _gmtCreate;
@synthesize countyName = _countyName;
@synthesize countyId = _countyId;
@synthesize townId = _townId;
@synthesize lat = _lat;
@synthesize cityName = _cityName;
@synthesize townName = _townName;
@synthesize type = _type;
@synthesize provinceName = _provinceName;
@synthesize entId = _entId;
@synthesize lng = _lng;
@synthesize provinceId = _provinceId;
@synthesize cityId = _cityId;

- (void)exchangeAddress{
    NSString * strProvince = [NSString stringWithFormat:@"%@%@%@%@",UnPackStr(self.provinceName),[self.provinceName isEqualToString:self.cityName]?@"":UnPackStr(self.cityName),UnPackStr(self.countyName),UnPackStr(self.townName)];
    self.addressShow = [NSString stringWithFormat:@"%@ %@",strProvince,UnPackStr(self.detailAddr)];
    
    self.provinceShow = strProvince;
    if (self.townId) {
        self.addressIDShow = self.townId;
    }else if(self.countyId){
        self.addressIDShow = self.countyId;
    }else if(self.cityId){
        self.addressIDShow = self.cityId;
    }else if(self.provinceId){
        self.addressIDShow = self.provinceId;
    }
}

#pragma mark init
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.iDProperty = [dict doubleValueForKey:kModelUsualAddressId];
            self.phone = [dict stringValueForKey:kModelUsualAddressPhone];
            self.entName = [dict stringValueForKey:kModelUsualAddressEntName];
            self.contact = [dict stringValueForKey:kModelUsualAddressContact];
            self.detailAddr = [dict stringValueForKey:kModelUsualAddressDetailAddr];
            self.dataState = [dict doubleValueForKey:kModelUsualAddressDataState];
            self.gmtCreate = [dict doubleValueForKey:kModelUsualAddressGmtCreate];
            self.countyName = [dict stringValueForKey:kModelUsualAddressCountyName];
            self.countyId = [dict doubleValueForKey:kModelUsualAddressCountyId];
            self.townId = [dict doubleValueForKey:kModelUsualAddressTownId];
            self.lat = [dict doubleValueForKey:kModelUsualAddressLat];
            self.cityName = [dict stringValueForKey:kModelUsualAddressCityName];
            self.townName = [dict stringValueForKey:kModelUsualAddressTownName];
            self.type = [dict doubleValueForKey:kModelUsualAddressType];
            self.provinceName = [dict stringValueForKey:kModelUsualAddressProvinceName];
            self.entId = [dict doubleValueForKey:kModelUsualAddressEntId];
            self.lng = [dict doubleValueForKey:kModelUsualAddressLng];
            self.provinceId = [dict doubleValueForKey:kModelUsualAddressProvinceId];
            self.cityId = [dict doubleValueForKey:kModelUsualAddressCityId];
        
        [self exchangeAddress];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelUsualAddressId];
    [mutableDict setValue:self.phone forKey:kModelUsualAddressPhone];
    [mutableDict setValue:self.entName forKey:kModelUsualAddressEntName];
    [mutableDict setValue:self.contact forKey:kModelUsualAddressContact];
    [mutableDict setValue:self.detailAddr forKey:kModelUsualAddressDetailAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataState] forKey:kModelUsualAddressDataState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtCreate] forKey:kModelUsualAddressGmtCreate];
    [mutableDict setValue:self.countyName forKey:kModelUsualAddressCountyName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countyId] forKey:kModelUsualAddressCountyId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.townId] forKey:kModelUsualAddressTownId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kModelUsualAddressLat];
    [mutableDict setValue:self.cityName forKey:kModelUsualAddressCityName];
    [mutableDict setValue:self.townName forKey:kModelUsualAddressTownName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kModelUsualAddressType];
    [mutableDict setValue:self.provinceName forKey:kModelUsualAddressProvinceName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.entId] forKey:kModelUsualAddressEntId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kModelUsualAddressLng];
    [mutableDict setValue:[NSNumber numberWithDouble:self.provinceId] forKey:kModelUsualAddressProvinceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cityId] forKey:kModelUsualAddressCityId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
