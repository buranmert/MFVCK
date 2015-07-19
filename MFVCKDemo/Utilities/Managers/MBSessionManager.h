//
//  MBSessionManager.h
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBLoginRequestModel;

@interface MBSessionManager : NSObject

+ (instancetype)sharedManager;

@property (atomic, strong) MBLoginRequestModel *rememberedLoginRequestModel;

@end
