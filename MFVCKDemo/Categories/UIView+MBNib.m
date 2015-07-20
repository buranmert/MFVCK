//
//  UIView+MBNib.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "UIView+MBNib.h"
#import <UIKit/UINibLoading.h>

@implementation UIView (MBNib)

+ (instancetype)viewWithNib {
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *viewsArray = [mainBundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    return [viewsArray firstObject];
}

+ (UINib *)classNib {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
    return nib;
}

@end
