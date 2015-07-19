//
//  MBSessionManager.m
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBSessionManager.h"
#import "MBLoginRequestModel.h"

#warning ONLY FOR DEBUGGING PURPOSE: KEYCHAIN SHOULD BE USED!!!
static NSString * const MBUserDefaultsUsernameKey = @"MBUsernameKey";
static NSString * const MBUserDefaultsPasswordKey = @"MBPasswordKey";

@implementation MBSessionManager

+ (instancetype)sharedManager {
    static MBSessionManager *instance;
    static dispatch_once_t onceTokenSharedInstance;
    dispatch_once(&onceTokenSharedInstance, ^{
        instance = [MBSessionManager new];
    });
    return instance;
}

- (MBLoginRequestModel *)rememberedLoginRequestModel {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *rememberedUsername = [userDefaults stringForKey:MBUserDefaultsUsernameKey];
    NSString *rememberedPassword = [userDefaults stringForKey:MBUserDefaultsPasswordKey];
    MBLoginRequestModel *rememberedLoginRequest = nil;
    if (rememberedUsername.length > 0 && rememberedPassword.length > 0) {
        rememberedLoginRequest = [[MBLoginRequestModel alloc] initWithUsername:rememberedUsername password:rememberedPassword];
    }
    return rememberedLoginRequest;
}

- (void)setRememberedLoginRequestModel:(MBLoginRequestModel *)rememberedLoginRequestModel {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (rememberedLoginRequestModel != nil) {
        NSString *username = rememberedLoginRequestModel.username;
        NSString *password = rememberedLoginRequestModel.password;
        [userDefaults setObject:username forKey:MBUserDefaultsUsernameKey];
        [userDefaults setObject:password forKey:MBUserDefaultsPasswordKey];
    }
    else {
        [userDefaults removeObjectForKey:MBUserDefaultsUsernameKey];
        [userDefaults removeObjectForKey:MBUserDefaultsPasswordKey];
    }
}

@end
