//
//  MBBaseTableViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController.h"

@class UITableView;

@interface MBBaseTableViewController : MBBaseViewController

@property (nonatomic, assign) UIEdgeInsets tableViewInsets;
@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIView *backgroundView;


@end
