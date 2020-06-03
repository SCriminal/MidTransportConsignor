//
//  ModelCarTeam.h
//
//  Created by 林栋 隋 on 2019/12/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelCarTeam : NSObject

@property (nonatomic, strong) NSString *carrierContact;
@property (nonatomic, strong) NSString *carrierEntSimpleName;
@property (nonatomic, strong) NSString *carrierEntName;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *carrierEntCode;
@property (nonatomic, assign) double date;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *carrierPhone;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double carrierEntId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
