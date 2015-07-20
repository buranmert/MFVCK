//
//  MBLoginDataController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBLoginDataController.h"
#import "MBSessionManager.h"
#import "MBNetworkManager.h"
#import "MBLoginResponseModel.h"

static NSString * const MBLoginRelativePath = @"/v2/users/authenticate";
static NSString * const MBLoginUsernameKey = @"login";
static NSString * const MBLoginPasswordKey = @"password";

@implementation MBLoginDataController

- (MBHTTPRequestOperation *)loginWithLoginRequest:(MBLoginRequestModel *)request loginOptions:(MBLoginOption)loginOption completion:(LoginCompletion)completion {
    NSDictionary *paramDict = @{MBLoginUsernameKey : request.username,
                                MBLoginPasswordKey: request.password};
    
    return [[MBNetworkManager sharedManager]
            getWithRelativePath:MBLoginRelativePath
            parameters:paramDict
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (loginOption & MBLoginOptionStaySignedIn) {
                    [[MBSessionManager sharedManager] setRememberedLoginRequestModel:request];
                }
                else {
                    [[MBSessionManager sharedManager] setRememberedLoginRequestModel:nil];
                }
                NSError *error = nil;
                MBLoginResponseModel *responseModel = [MTLJSONAdapter modelOfClass:[MBLoginResponseModel class] fromJSONDictionary:responseObject error:&error];
                [[MBSessionManager sharedManager] setSuccessfulLoginResponse:responseModel];
                if (completion != nil) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(YES, nil);
                    });
                }
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (completion != nil) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(NO, error);
                    });
                }
            }];
}

- (NSString *)rememberedUsername {
    return [[MBSessionManager sharedManager] rememberedLoginRequestModel].username;
}

@end
