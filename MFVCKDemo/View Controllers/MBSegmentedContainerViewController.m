//
//  MBSegmentedContainerViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBSegmentedContainerViewController.h"
#import <UIKit/UISegmentedControl.h>

#import "UIView+MBAutolayout.h"

@interface MBSegmentedContainerViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, strong, readonly) UIViewController *presentedChildViewController;

@end

@implementation MBSegmentedContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSegmentedControl];
}

- (void)setupSegmentedControl {
    [self.segmentedControl removeAllSegments];
    NSUInteger numberOfSegments = [self.dataSource numberOfChildViewControllers];
    NSString *title = nil;
    for (NSUInteger i = 0; i < numberOfSegments; i++) {
        title = [self.dataSource titleForChildViewControllerAtIndex:i];
        [self.segmentedControl insertSegmentWithTitle:title atIndex:i animated:NO];
    }
    
    [self.segmentedControl setSelectedSegmentIndex:0];
    [self showViewControllerAtIndex:0];
}

- (IBAction)segmentedControlValueDidChange:(UISegmentedControl *)sender {
    NSInteger selectedIndex = sender.selectedSegmentIndex;
    [self dismissPresentedChildViewController];
    [self showViewControllerAtIndex:selectedIndex];
}

- (void)dismissPresentedChildViewController {
    UIViewController *childViewController = self.presentedChildViewController;
    if (childViewController != nil) {
        [childViewController.view removeFromSuperview];
//        [childViewController removeFromParentViewController];
    }
}

- (void)showViewControllerAtIndex:(NSInteger)index {
    if (index >= [self.dataSource numberOfChildViewControllers]) {
        NSLog(@"ERROR! Child view controller index out of bounds!");
        return;
    }
    UIViewController *childViewController = [self.dataSource childViewControllerAtIndex:index];
    [self addChildViewController:childViewController];
    [childViewController willMoveToParentViewController:self];
    [self.containerView addSubview:childViewController.view];
    [childViewController.view mb_coverSuperviewWithInset:UIEdgeInsetsZero];
    [childViewController didMoveToParentViewController:self];
}

#pragma mark - Private

- (UIViewController *)presentedChildViewController {
    return [self.childViewControllers lastObject];
}

@end
