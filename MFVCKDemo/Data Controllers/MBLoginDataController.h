//
//  MBLoginDataController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBLoginRequestModel.h"
#import "MBNetworkTypes.h"

typedef NS_ENUM(NSUInteger, MBLoginOption) {
    MBLoginOptionDefault = 1 << 0,
    MBLoginOptionStaySignedIn = 1 << 1,
};

typedef void (^LoginCompletion)(BOOL success, NSError *error);

@interface MBLoginDataController : NSObject

- (MBHTTPRequestOperation *)loginWithLoginRequest:(MBLoginRequestModel *)request loginOptions:(MBLoginOption)loginOption completion:(LoginCompletion)completion;
- (NSString *)rememberedUsername;

@end
