//
//  ModelCar.h
//
//  Created by 林栋 隋 on 2019/12/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelCar : NSObject

@property (nonatomic, strong) NSString *contactPhone;
@property (nonatomic, strong) NSString *trailerNumber;
@property (nonatomic, assign) double licenceType;
@property (nonatomic, strong) NSString *vehicleNumber;
@property (nonatomic, assign) double vehicleLength;
@property (nonatomic, assign) double axle;
@property (nonatomic, strong) NSString *vin;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *driverName;
@property (nonatomic, assign) double driverId;
@property (nonatomic, assign) double vehicleType;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *engineNumber;
@property (nonatomic, assign) double entId;
@property (nonatomic, assign) double submitTime;
@property (nonatomic, strong) NSString *driverLicense;
@property (nonatomic, strong) NSString *driverPhone;
@property (nonatomic, assign) double qualificationState;
@property (nonatomic, assign) double vehicleLoad;
@property (nonatomic, strong) NSString *vehicleLicense;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double trailerLicenceType;
@property (nonatomic, assign) double isTrailer;

//logical
@property (nonatomic, strong) NSString *vehiclePropertyShow;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
