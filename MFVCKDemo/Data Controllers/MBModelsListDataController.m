//
//  MBModelsListDataController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListDataController.h"
#import "MBModelsListItemDataModel.h"

@interface MBModelsListDataController ()

@property (nonatomic, assign) MBModelsListType modelsListType;

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
    MBModelsListItemDataModel *data = [MBModelsListItemDataModel new];
    return data;
}

- (NSInteger)numberOfDataModels {
    return 15.f;
}

@end
