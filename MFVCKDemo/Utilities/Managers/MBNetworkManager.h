//
//  MBNetworkManager.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

typedef AFHTTPRequestOperation MBHTTPRequestOperation;

@interface MBNetworkManager : NSObject

+ (instancetype)sharedManager;

- (MBHTTPRequestOperation *)getWithRelativePath:(NSString *)relativePath
                                     parameters:(id)parameters
                                        success:(void (^)(MBHTTPRequestOperation *operation, id responseObject))success
                                        failure:(void (^)(MBHTTPRequestOperation *operation, NSError *error))failure;

@end
