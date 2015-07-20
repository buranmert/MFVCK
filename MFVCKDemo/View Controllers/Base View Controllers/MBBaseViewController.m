//
//  MBBaseViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController.h"

@interface MBBaseViewController ()

@end

@implementation MBBaseViewController

- (instancetype)initWithClassNib {
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    return self;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
