//
//  MBInputFieldTableViewCell+MBInputFormAdditions.m
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBInputFieldTableViewCell+MBInputFormAdditions.h"
#import <objc/runtime.h>

@implementation MBInputFieldTableViewCell (MBInputFormAdditions)
@dynamic inputFieldType;
@dynamic valid;

- (void)setInputFieldType:(MBInputFieldType)inputFieldType {
    objc_setAssociatedObject(self, @selector(inputFieldType), @(inputFieldType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBInputFieldType)inputFieldType {
    NSNumber *numberValue = objc_getAssociatedObject(self, @selector(inputFieldType));
    return numberValue.unsignedIntegerValue;
}

- (void)setValid:(BOOL)valid {
    objc_setAssociatedObject(self, @selector(isValid), @(valid), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isValid {
    NSNumber *numberValue = objc_getAssociatedObject(self, @selector(isValid));
    return numberValue.boolValue;
}

@end
