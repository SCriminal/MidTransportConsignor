//
//  ModelCar.m
//
//  Created by 林栋 隋 on 2019/12/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelCar.h"


NSString *const kModelCarContactPhone = @"contactPhone";
NSString *const kModelCarTrailerNumber = @"trailerNumber";
NSString *const kModelCarLicenceType = @"licenceType";
NSString *const kModelCarVehicleNumber = @"vehicleNumber";
NSString *const kModelCarVehicleLength = @"vehicleLength";
NSString *const kModelCarAxle = @"axle";
NSString *const kModelCarVin = @"vin";
NSString *const kModelCarName = @"name";
NSString *const kModelCarDriverName = @"driverName";
NSString *const kModelCarDriverId = @"driverId";
NSString *const kModelCarVehicleType = @"vehicleType";
NSString *const kModelCarId = @"id";
NSString *const kModelCarEngineNumber = @"engineNumber";
NSString *const kModelCarEntId = @"entId";
NSString *const kModelCarSubmitTime = @"submitTime";
NSString *const kModelCarDriverLicense = @"driverLicense";
NSString *const kModelCarDriverPhone = @"driverPhone";
NSString *const kModelCarQualificationState = @"qualificationState";
NSString *const kModelCarVehicleLoad = @"vehicleLoad";
NSString *const kModelCarVehicleLicense = @"vehicleLicense";
NSString *const kModelCarUserId = @"userId";


@interface ModelCar ()
@end

@implementation ModelCar

@synthesize contactPhone = _contactPhone;
@synthesize trailerNumber = _trailerNumber;
@synthesize licenceType = _licenceType;
@synthesize vehicleNumber = _vehicleNumber;
@synthesize vehicleLength = _vehicleLength;
@synthesize axle = _axle;
@synthesize vin = _vin;
@synthesize name = _name;
@synthesize driverName = _driverName;
@synthesize driverId = _driverId;
@synthesize vehicleType = _vehicleType;
@synthesize iDProperty = _iDProperty;
@synthesize engineNumber = _engineNumber;
@synthesize entId = _entId;
@synthesize submitTime = _submitTime;
@synthesize driverLicense = _driverLicense;
@synthesize driverPhone = _driverPhone;
@synthesize qualificationState = _qualificationState;
@synthesize vehicleLoad = _vehicleLoad;
@synthesize vehicleLicense = _vehicleLicense;
@synthesize userId = _userId;


- (void)exchangeProperty{
    NSMutableArray * aryMu = [NSMutableArray array];
    NSString * strVehicleType = [GlobalMethod exchangeCarType:(self.vehicleType)];
    if (isStr(strVehicleType)) {
        [aryMu addObject:strVehicleType];
    }
    [aryMu addObject:[NSString stringWithFormat:@"车长%@米",NSNumber.dou(self.vehicleLength)]];

    [aryMu addObject:[NSString stringWithFormat:@"载重%@吨",NSNumber.dou(self.vehicleLoad)]];

    [aryMu addObject:[NSString stringWithFormat:@"%@车轴",NSNumber.dou(self.axle)]];

    self.vehiclePropertyShow = [aryMu componentsJoinedByString:@" "];
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
            self.contactPhone = [dict stringValueForKey:kModelCarContactPhone];
            self.trailerNumber = [dict stringValueForKey:kModelCarTrailerNumber];
            self.licenceType = [dict doubleValueForKey:kModelCarLicenceType];
            self.vehicleNumber = [dict stringValueForKey:kModelCarVehicleNumber];
            self.vehicleLength = [dict doubleValueForKey:kModelCarVehicleLength];
            self.axle = [dict doubleValueForKey:kModelCarAxle];
            self.vin = [dict stringValueForKey:kModelCarVin];
            self.name = [dict stringValueForKey:kModelCarName];
            self.driverName = [dict stringValueForKey:kModelCarDriverName];
            self.driverId = [dict doubleValueForKey:kModelCarDriverId];
            self.vehicleType = [dict doubleValueForKey:kModelCarVehicleType];
            self.iDProperty = [dict doubleValueForKey:kModelCarId];
            self.engineNumber = [dict stringValueForKey:kModelCarEngineNumber];
            self.entId = [dict doubleValueForKey:kModelCarEntId];
            self.submitTime = [dict doubleValueForKey:kModelCarSubmitTime];
            self.driverLicense = [dict stringValueForKey:kModelCarDriverLicense];
            self.driverPhone = [dict stringValueForKey:kModelCarDriverPhone];
            self.qualificationState = [dict doubleValueForKey:kModelCarQualificationState];
            self.vehicleLoad = [dict doubleValueForKey:kModelCarVehicleLoad];
            self.vehicleLicense = [dict stringValueForKey:kModelCarVehicleLicense];
            self.userId = [dict doubleValueForKey:kModelCarUserId];
//logical
        [self exchangeProperty];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.contactPhone forKey:kModelCarContactPhone];
    [mutableDict setValue:self.trailerNumber forKey:kModelCarTrailerNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.licenceType] forKey:kModelCarLicenceType];
    [mutableDict setValue:self.vehicleNumber forKey:kModelCarVehicleNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleLength] forKey:kModelCarVehicleLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.axle] forKey:kModelCarAxle];
    [mutableDict setValue:self.vin forKey:kModelCarVin];
    [mutableDict setValue:self.name forKey:kModelCarName];
    [mutableDict setValue:self.driverName forKey:kModelCarDriverName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.driverId] forKey:kModelCarDriverId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleType] forKey:kModelCarVehicleType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelCarId];
    [mutableDict setValue:self.engineNumber forKey:kModelCarEngineNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.entId] forKey:kModelCarEntId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelCarSubmitTime];
    [mutableDict setValue:self.driverLicense forKey:kModelCarDriverLicense];
    [mutableDict setValue:self.driverPhone forKey:kModelCarDriverPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualificationState] forKey:kModelCarQualificationState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleLoad] forKey:kModelCarVehicleLoad];
    [mutableDict setValue:self.vehicleLicense forKey:kModelCarVehicleLicense];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kModelCarUserId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
