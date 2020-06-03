//
//  ModelCarTeam.m
//
//  Created by 林栋 隋 on 2019/12/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelCarTeam.h"


NSString *const kModelCarTeamCarrierContact = @"carrierContact";
NSString *const kModelCarTeamCarrierEntSimpleName = @"carrierEntSimpleName";
NSString *const kModelCarTeamCarrierEntName = @"carrierEntName";
NSString *const kModelCarTeamId = @"id";
NSString *const kModelCarTeamContact = @"contact";
NSString *const kModelCarTeamCarrierEntCode = @"carrierEntCode";
NSString *const kModelCarTeamDate = @"date";
NSString *const kModelCarTeamPhone = @"phone";
NSString *const kModelCarTeamCarrierPhone = @"carrierPhone";
NSString *const kModelCarTeamCreateTime = @"createTime";
NSString *const kModelCarTeamCarrierEntId = @"carrierEntId";


@interface ModelCarTeam ()
@end

@implementation ModelCarTeam

@synthesize carrierContact = _carrierContact;
@synthesize carrierEntSimpleName = _carrierEntSimpleName;
@synthesize carrierEntName = _carrierEntName;
@synthesize iDProperty = _iDProperty;
@synthesize contact = _contact;
@synthesize carrierEntCode = _carrierEntCode;
@synthesize date = _date;
@synthesize phone = _phone;
@synthesize carrierPhone = _carrierPhone;
@synthesize createTime = _createTime;
@synthesize carrierEntId = _carrierEntId;


#pragma mark init
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.carrierContact = [dict stringValueForKey:kModelCarTeamCarrierContact];
            self.carrierEntSimpleName = [dict stringValueForKey:kModelCarTeamCarrierEntSimpleName];
            self.carrierEntName = [dict stringValueForKey:kModelCarTeamCarrierEntName];
            self.iDProperty = [dict doubleValueForKey:kModelCarTeamId];
            self.contact = [dict stringValueForKey:kModelCarTeamContact];
            self.carrierEntCode = [dict stringValueForKey:kModelCarTeamCarrierEntCode];
            self.date = [dict doubleValueForKey:kModelCarTeamDate];
            self.phone = [dict stringValueForKey:kModelCarTeamPhone];
            self.carrierPhone = [dict stringValueForKey:kModelCarTeamCarrierPhone];
            self.createTime = [dict doubleValueForKey:kModelCarTeamCreateTime];
            self.carrierEntId = [dict doubleValueForKey:kModelCarTeamCarrierEntId];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.carrierContact forKey:kModelCarTeamCarrierContact];
    [mutableDict setValue:self.carrierEntSimpleName forKey:kModelCarTeamCarrierEntSimpleName];
    [mutableDict setValue:self.carrierEntName forKey:kModelCarTeamCarrierEntName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelCarTeamId];
    [mutableDict setValue:self.contact forKey:kModelCarTeamContact];
    [mutableDict setValue:self.carrierEntCode forKey:kModelCarTeamCarrierEntCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.date] forKey:kModelCarTeamDate];
    [mutableDict setValue:self.phone forKey:kModelCarTeamPhone];
    [mutableDict setValue:self.carrierPhone forKey:kModelCarTeamCarrierPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kModelCarTeamCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carrierEntId] forKey:kModelCarTeamCarrierEntId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
