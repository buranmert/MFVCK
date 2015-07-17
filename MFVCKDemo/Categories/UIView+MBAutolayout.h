//
//  UIView+MBAutolayout.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIView.h>

@interface UIView (MBAutolayout)

- (void)mb_coverSuperviewWithInset:(UIEdgeInsets)insets;
- (NSLayoutConstraint *)mb_addConstraintToSuperviewForAttribute:(NSLayoutAttribute)attribute withConstant:(CGFloat)constantValue;

@end
