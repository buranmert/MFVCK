//
//  MBBaseTableViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseTableViewController.h"
#import <UIKit/UITableViewController.h>
#import "UIView+MBAutolayout.h"

typedef UITableViewController MBChildTableViewController;

static CGFloat const MBDefaultTableViewInset = 0.f;

@interface MBBaseTableViewController ()

@property (nonatomic, strong) MBChildTableViewController *childTableViewController;
@property (nonatomic, weak) NSLayoutConstraint *topConstraint;
@property (nonatomic, weak) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *leftConstraint;
@property (nonatomic, weak) NSLayoutConstraint *rightConstraint;

@end

@implementation MBBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildTableViewControllerView];
}

- (void)addChildTableViewControllerView {
    [self.childTableViewController willMoveToParentViewController:self];
    [self addChildViewController:self.childTableViewController];
    [self.childTableViewController didMoveToParentViewController:self];
    
    UIView *childView = self.childTableViewController.view;
    [self.view insertSubview:childView atIndex:(self.backgroundView == nil ? 0 : 1)];
    self.topConstraint = [childView mb_addConstraintToSuperviewForAttribute:NSLayoutAttributeTop withConstant:MBDefaultTableViewInset];
    self.bottomConstraint = [childView mb_addConstraintToSuperviewForAttribute:NSLayoutAttributeBottom withConstant:MBDefaultTableViewInset];
    self.leftConstraint = [childView mb_addConstraintToSuperviewForAttribute:NSLayoutAttributeLeft withConstant:MBDefaultTableViewInset];
    self.rightConstraint = [childView mb_addConstraintToSuperviewForAttribute:NSLayoutAttributeRight withConstant:MBDefaultTableViewInset];
}

#pragma mark - Properties

- (void)setTableViewInsets:(UIEdgeInsets)tableViewInsets {
    self.topConstraint.constant = tableViewInsets.top;
    self.bottomConstraint.constant = -tableViewInsets.bottom;
    self.leftConstraint.constant = tableViewInsets.left;
    self.rightConstraint.constant = -tableViewInsets.right;
    [self.view updateConstraintsIfNeeded];
}

- (UITableView *)tableView {
    return self.childTableViewController.tableView;
}

#pragma mark - Private

- (MBChildTableViewController *)childTableViewController {
    if (_childTableViewController == nil) {
        MBChildTableViewController *tableViewController = [MBChildTableViewController new];
        _childTableViewController = tableViewController;
    }
    return _childTableViewController;
}

@end
