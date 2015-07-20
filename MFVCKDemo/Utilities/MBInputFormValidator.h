//
//  MBInputFormValidator.h
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBInputFormEnumTypes.h"

@interface MBInputFormValidator : NSObject

+ (BOOL)isValidString:(NSString *)string forInputType:(MBInputFieldType)inputType;

@end
