//
//  MBInputFormValidator.m
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBInputFormValidator.h"

@implementation MBInputFormValidator

+ (BOOL)isValidString:(NSString *)string forInputType:(MBInputFieldType)inputType  {
    return string.length > 0;
}

@end
