//
//  MBLoginResponseModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBLoginResponseModel.h"

@implementation MBLoginResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"email": @"email",
             @"name": @"name",
             @"uuid": @"uuid",
             @"api_key": @"api_key",
             @"updated_at": @"updated_at",};
}

@end
