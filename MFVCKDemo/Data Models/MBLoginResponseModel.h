//
//  MBLoginResponseModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface MBLoginResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *uuid;
@property (nonatomic, copy, readonly) NSString *api_key;
@property (nonatomic, copy, readonly) NSString *updated_at;

@end
