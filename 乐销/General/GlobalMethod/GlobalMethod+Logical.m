//
//  GlobalMethod+Logical.m
//中车运
//
//  Created by 隋林栋 on 2018/11/7.
//  Copyright © 2018 ping. All rights reserved.
//

#import "GlobalMethod+Logical.h"

@implementation GlobalMethod (Logical)

//judge login state
+ (void)judgeLoginState:(void(^)(void))blockLoginComplete{
    if([self isLoginSuccess]){
        if(blockLoginComplete){
            blockLoginComplete();
        }
    }else{
        [GB_Nav pushVCName:@"LoginViewController" animated:true];
    }
}
+ (BOOL)isLoginSuccess{
    return [GlobalData sharedInstance].GB_UserModel.userId && [GlobalData sharedInstance].GB_CompanyModel.iDProperty != 0 && [GlobalData sharedInstance].GB_CompanyModel.isEnt;
}

+ (NSString *)exchangeVehicleType:(NSString *)identity{
    NSArray * aryDateTypes = @[@"普通货车",@"厢式货车",@"罐式货车",@"牵引车",@"普通挂车",@"罐式挂车",@"集装箱挂车",@"仓栅式货车",@"封闭货车",@"平板货车",@"集装箱车",@"自卸货车",@"特殊结构货车",@"专项作业车",@"厢式挂车",@"仓栅式挂车",@"平板挂车",@"自卸挂车",@"专项作业挂车",@"车辆运输车",@"车辆运输车（单排）"];
    NSArray * aryDateId = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21];
    for (int i = 0; i<aryDateId.count; i++) {
        NSNumber * num = aryDateId[i];
        if (num.doubleValue == identity.doubleValue) {
            return aryDateTypes[i];
        }
    }
    return nil;
}
@end
