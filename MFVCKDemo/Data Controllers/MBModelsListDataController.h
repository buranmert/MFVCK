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

/*
 this class supports both public and private models lists
 */
- (instancetype)initWithModelsListType:(MBModelsListType)modelsListType;

/*
 fetches models and stores them
 */
- (MBHTTPRequestOperation *)fetchModelListItemsWithCompletion:(FetchCompletion)completion;

/*
 those methods are to be consumed by table views
 */
- (NSInteger)numberOfDataModels;
- (MBModelsListItemDataModel *)dataModelAtIndex:(NSInteger)index;

@end
