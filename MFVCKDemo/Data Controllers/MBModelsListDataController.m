//
//  MBModelsListDataController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListDataController.h"
#import "MBModelsListItemDataModel.h"

#import "MBSessionManager.h"
#import "MBNetworkManager.h"

static NSString * const MBPublicListRelativePath = @"/v2/model3ds";
static NSString * const MBPrivateListRelativePathWithOneVariable = @"/v2/users/%@/model3ds";
static NSString * const MBRequestLimitKey = @"limit";
static NSString * const MBRequestAPIKey = @"api_key";
static NSInteger const MBItemCountLimit = 10;

@interface MBModelsListDataController ()

@property (nonatomic, assign) MBModelsListType modelsListType;
@property (nonatomic, strong) NSArray *modelsDataSourceArray;

@end

@implementation MBModelsListDataController

- (instancetype)initWithModelsListType:(MBModelsListType)modelsListType {
    self = [super init];
    if (self != nil) {
        self.modelsListType = modelsListType;
    }
    return self;
}

- (MBModelsListItemDataModel *)dataModelAtIndex:(NSInteger)index {
    MBModelsListItemDataModel *data = [self.modelsDataSourceArray objectAtIndex:index];
    return data;
}

- (NSInteger)numberOfDataModels {
    return self.modelsDataSourceArray.count;
}

- (MBHTTPRequestOperation *)fetchModelListItemsWithCompletion:(FetchCompletion)completion {
    return [[MBNetworkManager sharedManager] getWithRelativePath:[self relativePath]
                                               parameters:[self parametersDictionary]
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSArray *responseArray = responseObject;
                                                      NSError *error = nil;
                                                      self.modelsDataSourceArray = [MTLJSONAdapter modelsOfClass:[MBModelsListItemDataModel class] fromJSONArray:responseArray error:&error];
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

#pragma mark - Private

- (NSDictionary *)parametersDictionary {
    NSDictionary *paramDict = nil;
    switch (self.modelsListType) {
        case MBModelsListTypePublic: {
            paramDict = @{MBRequestLimitKey: @(MBItemCountLimit)};
            break;
        }
        case MBModelsListTypePrivate: {
            NSString *APIKey = [MBSessionManager sharedManager].activeAPIKey;
            paramDict = @{MBRequestLimitKey: @(MBItemCountLimit), MBRequestAPIKey: APIKey};
            break;
        }
    }
    return paramDict;
}

- (NSString *)relativePath {
    NSString *relativePath = nil;
    switch (self.modelsListType) {
        case MBModelsListTypePublic: {
            relativePath = MBPublicListRelativePath;
            break;
        }
        case MBModelsListTypePrivate: {
            NSString *UUID = [MBSessionManager sharedManager].activeUUID;
            relativePath = [NSString stringWithFormat:MBPrivateListRelativePathWithOneVariable, UUID];
            break;
        }
    }
    return relativePath;
}

@end
