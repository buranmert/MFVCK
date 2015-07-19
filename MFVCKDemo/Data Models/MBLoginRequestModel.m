//
//  MBLoginRequestModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBLoginRequestModel.h"

@implementation MBLoginRequestModel

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self != nil) {
        _username = username;
        _password = password;
    }
    return self;
}

@end
