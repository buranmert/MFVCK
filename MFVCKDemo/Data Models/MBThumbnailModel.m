//
//  MBThumbnailModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBThumbnailModel.h"

@implementation MBThumbnailModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"url": @"url",
             @"width": @"width",
             @"height": @"height"};
}

@end
