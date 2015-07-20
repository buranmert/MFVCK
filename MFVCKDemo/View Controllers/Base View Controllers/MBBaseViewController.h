//
//  MBBaseViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIViewController.h>
#import "MBNetworkTypes.h"

@interface MBBaseViewController : UIViewController

- (instancetype)initWithClassNib;

- (void)showLoadingViewWithOperation:(MBHTTPRequestOperation *)operation;
- (void)showErrorViewWithMessage:(NSString *)errorMessage;

@end
