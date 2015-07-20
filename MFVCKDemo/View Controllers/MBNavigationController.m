//
//  MBNavigationController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBNavigationController.h"

@implementation MBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTranslucent:NO];
}

- (NSUInteger)supportedInterfaceOrientations {
    NSUInteger supportedInterfaceOrientation;
    if (self.presentedViewController != nil) {
        supportedInterfaceOrientation = [self.presentedViewController supportedInterfaceOrientations];
    }
    else {
        supportedInterfaceOrientation = [self.topViewController supportedInterfaceOrientations];
    }
    return supportedInterfaceOrientation;
}

- (BOOL)shouldAutorotate {
    BOOL shouldAutorotate;
    if (self.presentedViewController != nil) {
        shouldAutorotate = [self.presentedViewController shouldAutorotate];
    }
    else {
        shouldAutorotate = [self.topViewController shouldAutorotate];
    }
    return shouldAutorotate;
}

@end
