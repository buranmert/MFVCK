//
//  MBModelsListItemDataModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListItemDataModel.h"

@implementation MBModelsListItemDataModel

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _title = @"this is title";
    }
    return self;
}

@end
