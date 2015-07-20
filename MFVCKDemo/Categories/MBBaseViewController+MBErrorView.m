//
//  MBBaseViewController+MBErrorView.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController+MBErrorView.h"
#import "MBLabel.h"
#import "UIView+MBAutolayout.h"

static CGFloat const MBErrorViewInitialAlpha = 0.f;
static CGFloat const MBErrorViewFinalAlpha = 1.f;
static NSTimeInterval const MBErrorViewAnimationDuration = 1.5;

@implementation MBBaseViewController (MBErrorView)

//- (void)showErrorViewWithMessage:(NSString *)errorMessage completion:(ErrorViewCompletion)completion {
//    MBLabel *errorView = [[MBLabel alloc] initWithFrame:CGRectZero];
//    errorView.numberOfLines = 0;
//    errorView.text = errorMessage;
//    errorView.alpha = MBErrorViewInitialAlpha;
//    CGSize sizeThatFits = [errorView sizeThatFits:CGSizeMake(CGRectGetWidth(self.view.bounds), CGFLOAT_MAX)];
//    CGRect frame = CGRectMake(0.f, 0.f, sizeThatFits.width, sizeThatFits.height);
//    [errorView setFrame:frame];
//    [self.view addSubview:errorView];
//    [UIView animateWithDuration:MBErrorViewAnimationDuration
//                          delay:0.f
//                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         errorView.alpha = MBErrorViewFinalAlpha;
//                     } completion:^(BOOL finished) {
//                         [UIView animateWithDuration:MBErrorViewAnimationDuration
//                                               delay:0.f
//                                             options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
//                                          animations:^{
//                                              errorView.alpha = MBErrorViewInitialAlpha;
//                                          } completion:^(BOOL finished) {
//                                              [errorView removeFromSuperview];
//                                              if (completion != nil) {
//                                                  completion();
//                                              }
//                                          }];
//                     }];
//}

@end
