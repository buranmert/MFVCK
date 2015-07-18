//
//  UIView+MBAutolayout.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "UIView+MBAutolayout.h"

@implementation UIView (MBAutolayout)

- (void)mb_coverSuperviewWithInset:(UIEdgeInsets)insets {
    NSAssert(self.superview != nil, @"view must have a superview to cover!");
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *superview = self.superview;
    
    [superview addConstraint:[UIView constraintToSuperviewFromView:self forAttribute:NSLayoutAttributeTop withConstant:insets.top]];
    [superview addConstraint:[UIView constraintToSuperviewFromView:self forAttribute:NSLayoutAttributeTop withConstant:insets.bottom]];
    [superview addConstraint:[UIView constraintToSuperviewFromView:self forAttribute:NSLayoutAttributeTop withConstant:insets.left]];
    [superview addConstraint:[UIView constraintToSuperviewFromView:self forAttribute:NSLayoutAttributeTop withConstant:insets.right]];
}

- (NSLayoutConstraint *)mb_addConstraintToSuperviewForAttribute:(NSLayoutAttribute)attribute withConstant:(CGFloat)constantValue {
    NSAssert(self.superview != nil, @"view must have a superview to cover!");
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *superview = self.superview;
    
    NSLayoutConstraint *constraint = [UIView constraintToSuperviewFromView:self forAttribute:attribute withConstant:constantValue];
    [superview addConstraint:constraint];
    return constraint;
}

#pragma mark - Private methods

+ (NSLayoutConstraint *)constraintToSuperviewFromView:(UIView *)fromView forAttribute:(NSLayoutAttribute)attribute withConstant:(CGFloat)constantValue {
    CGFloat effectiveConstantValue = constantValue;
    if (attribute == NSLayoutAttributeRight || attribute == NSLayoutAttributeBottom) {
        effectiveConstantValue = -effectiveConstantValue;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:attribute relatedBy:NSLayoutRelationEqual toItem:fromView.superview attribute:attribute multiplier:1.f constant:constantValue];
    return constraint;
}

@end
