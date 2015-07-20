//
//  MBModelsListDataController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListDataController.h"
#import "MBModelsListItemDataModel.h"

#import <AFNetworking/AFNetworking.h>

static NSString * const MBBaseURLPath = @"http://webservice.augmentedev.com/";

@interface MBModelsListDataController ()

@property (nonatomic, assign) MBModelsListType modelsListType;
@property (nonatomic, strong) AFHTTPRequestOperationManager *networkManager;

@end

@implementation MBModelsListDataController

- (instancetype)initWithModelsListType:(MBModelsListType)modelsListType {
    self = [super init];
    if (self != nil) {
        self.modelsListType = modelsListType;
    }
    return self;
}

- (AFHTTPRequestOperationManager *)networkManager {
    if (_networkManager == nil) {
        _networkManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:MBBaseURLPath]];
    }
    return _networkManager;
}

- (MBModelsListItemDataModel *)dataModelAtIndex:(NSInteger)index {
    MBModelsListItemDataModel *data = [MBModelsListItemDataModel new];
    return data;
}

- (NSInteger)numberOfDataModels {
    return 15.f;
}

- (void)fetchModelListItemsWithCompletion:(FetchCompletion)completion {
    [self.networkManager GET:@"/v2/model3ds"
                  parameters:@{@"limit": @(10)}
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                         if (completion != nil) {
                             completion(YES);
                         }
                     }
                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                         if (completion != nil) {
                             completion(NO);
                         }
                     }];
}

@end
