//
//  MBBaseViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIViewController.h>
#import <UIKit/NSLayoutConstraint.h>

@interface MBBaseViewController : UIViewController

- (instancetype)initWithClassNib;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topSpaceConstraint;

@end
