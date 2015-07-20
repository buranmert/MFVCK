//
//  MBModelsListDataController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBNetworkTypes.h"

@class MBModelsListItemDataModel;

typedef void (^FetchCompletion)(BOOL success, NSError *error);

typedef NS_ENUM(NSUInteger, MBModelsListType) {
    MBModelsListTypePublic = 0,
    MBModelsListTypePrivate,
};

@interface MBModelsListDataController : NSObject

- (instancetype)initWithModelsListType:(MBModelsListType)modelsListType;
- (MBHTTPRequestOperation *)fetchModelListItemsWithCompletion:(FetchCompletion)completion;
- (NSInteger)numberOfDataModels;
- (MBModelsListItemDataModel *)dataModelAtIndex:(NSInteger)index;

@end
