//
//  MBLoginRequestModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 19/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBLoginRequestModel : NSObject

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *password;

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end
