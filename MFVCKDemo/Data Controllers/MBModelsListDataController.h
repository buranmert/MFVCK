//
//  MBModelsListDataController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBModelsListItemDataModel;

typedef NS_ENUM(NSUInteger, MBModelsListType) {
    MBModelsListTypePublic = 0,
    MBModelsListTypePrivate,
};

#warning MOCK IMPLEMENTATION

@interface MBModelsListDataController : NSObject

- (instancetype)initWithModelsListType:(MBModelsListType)modelsListType;
- (NSInteger)numberOfDataModels;
- (MBModelsListItemDataModel *)dataModelAtIndex:(NSInteger)index;

@end
