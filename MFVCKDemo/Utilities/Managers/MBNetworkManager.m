//
//  MBNetworkManager.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const MBBaseURLPath = @"http://webservice.augmentedev.com/";

@interface MBNetworkManager ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *networkManager;
@property (nonatomic, strong) dispatch_queue_t backgroundCompletionQueue;

@end

@implementation MBNetworkManager

+ (instancetype)sharedManager {
    static MBNetworkManager *instance;
    static dispatch_once_t onceTokenSharedInstance;
    dispatch_once(&onceTokenSharedInstance, ^{
        instance = [MBNetworkManager new];
    });
    return instance;
}

- (AFHTTPRequestOperationManager *)networkManager {
    if (_networkManager == nil) {
        _networkManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:MBBaseURLPath]];
        self.backgroundCompletionQueue = dispatch_queue_create("MBNetworkManagerBackgroundCompletionQueue", NULL);
        [_networkManager setCompletionQueue:self.backgroundCompletionQueue];
    }
    return _networkManager;
}

- (MBHTTPRequestOperation *)getWithRelativePath:(NSString *)relativePath
                                     parameters:(id)parameters
                                        success:(void (^)(MBHTTPRequestOperation *operation, id responseObject))success
                                        failure:(void (^)(MBHTTPRequestOperation *operation, NSError *error))failure {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    return [self.networkManager GET:relativePath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (success != nil) {
            success(operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        if (failure != nil) {
            failure(operation, error);
        }
    }];
}

@end
