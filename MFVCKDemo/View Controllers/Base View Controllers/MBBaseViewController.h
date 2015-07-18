//
//  MBBaseViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIViewController.h>

@class MBScrollView;

@interface MBBaseViewController : UIViewController

@property (nonatomic, weak) IBOutlet MBScrollView *scrollView;

@end
