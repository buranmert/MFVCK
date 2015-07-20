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

/*
 this class is a proxy, in the future we may switch to another networking library (non-AFNetworking) and that day we will only have to change internal implementation of this class
 */
@interface MBNetworkManager : NSObject

+ (instancetype)sharedManager;

- (MBHTTPRequestOperation *)getWithRelativePath:(NSString *)relativePath
                                     parameters:(id)parameters
                                        success:(void (^)(MBHTTPRequestOperation *operation, id responseObject))success
                                        failure:(void (^)(MBHTTPRequestOperation *operation, NSError *error))failure;

@end
