//
//  MBLoginDataController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBLoginDataController.h"
#import "MBSessionManager.h"

@implementation MBLoginDataController

- (void)loginWithLoginRequest:(MBLoginRequestModel *)request loginOptions:(MBLoginOption)loginOption completion:(LoginCompletion)completion {
#warning MOCK IMPLEMENTATION
    if (loginOption & MBLoginOptionStaySignedIn) {
        [[MBSessionManager sharedManager] setRememberedLoginRequestModel:request];
    }
    else {
        [[MBSessionManager sharedManager] setRememberedLoginRequestModel:nil];
    }
    
    if (completion != nil) {
        completion(YES);
    }
}

- (NSString *)rememberedUsername {
    return [[MBSessionManager sharedManager] rememberedLoginRequestModel].username;
}

@end
