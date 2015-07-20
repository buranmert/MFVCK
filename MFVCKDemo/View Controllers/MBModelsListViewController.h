//
//  MBModelsListViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseTableViewController.h"

@class MBModelsListDataController;

@interface MBModelsListViewController : MBBaseTableViewController

- (instancetype)initWithModelsListDataController:(MBModelsListDataController *)dataController;

@end
