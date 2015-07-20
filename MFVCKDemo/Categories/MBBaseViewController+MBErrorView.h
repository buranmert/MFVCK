//
//  MBBaseViewController+MBErrorView.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController.h"

typedef void (^ErrorViewCompletion)();

#warning IN PROGRESS. NOT READY TO BE USED!

@interface MBBaseViewController (MBErrorView)

- (void)showErrorViewWithMessage:(NSString *)errorMessage completion:(ErrorViewCompletion)completion;

@end
