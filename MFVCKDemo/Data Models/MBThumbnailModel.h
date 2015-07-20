//
//  MBThumbnailModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface MBThumbnailModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSNumber *width;
@property (nonatomic, copy, readonly) NSNumber *height;

@end
