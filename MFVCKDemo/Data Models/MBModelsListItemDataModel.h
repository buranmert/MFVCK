//
//  MBModelsListItemDataModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MTLModel.h"
#import "MBThumbnailModel.h"

@interface MBModelsListItemDataModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) MBThumbnailModel *small_thumbnail;
@property (nonatomic, copy, readonly) MBThumbnailModel *large_thumbnail;

@end
