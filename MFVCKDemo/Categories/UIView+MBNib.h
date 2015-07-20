//
//  UIView+MBNib.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIView.h>
#import <UIKit/UINib.h>

@interface UIView (MBNib)

+ (instancetype)viewWithNib;
+ (UINib *)classNib;

@end
