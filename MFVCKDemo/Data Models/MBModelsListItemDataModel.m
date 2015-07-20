//
//  MBModelsListItemDataModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListItemDataModel.h"

@implementation MBModelsListItemDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"name": @"name",
             @"small_thumbnail": @"small_thumbnail",
             @"large_thumbnail": @"large_thumbnail"};
}

+ (NSValueTransformer *)large_thumbnailJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MBThumbnailModel class]];
}

+ (NSValueTransformer *)small_thumbnailJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MBThumbnailModel class]];
}

@end
