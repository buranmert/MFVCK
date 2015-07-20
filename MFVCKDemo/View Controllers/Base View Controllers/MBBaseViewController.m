//
//  MBBaseViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController.h"
#import <AFNetworking/UIActivityIndicatorView+AFNetworking.h>

@interface MBBaseViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

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
    return YES;
}

- (UIActivityIndicatorView *)loadingView {
    if (_loadingView == nil) {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_loadingView setFrame:self.view.bounds];
        [_loadingView setHidesWhenStopped:YES];
        [self.view addSubview:_loadingView];
    }
    return _loadingView;
}

- (void)showLoadingViewWithOperation:(MBHTTPRequestOperation *)operation {
    [self.loadingView setAnimatingWithStateOfOperation:(AFURLConnectionOperation *)operation];
}

- (void)showErrorViewWithMessage:(NSString *)errorMessage {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

@end
