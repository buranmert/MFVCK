//
//  MBSessionManager.h
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBLoginRequestModel;
@class MBLoginResponseModel;

@interface MBSessionManager : NSObject

+ (instancetype)sharedManager;

- (void)setSuccessfulLoginResponse:(MBLoginResponseModel *)responseModel;

@property (atomic, strong) MBLoginRequestModel *rememberedLoginRequestModel;
@property (atomic, copy, readonly) NSString *activeUUID;
@property (atomic, copy, readonly) NSString *activeAPIKey;

@end
