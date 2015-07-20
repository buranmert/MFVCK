//
//  MBModelsListViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListViewController.h"
#import "MBModelsListDataController.h"
#import "MBModelsListViewModel.h"

#import <UIKit/UITableView.h>

static NSInteger const MBMaxItemCount = 10;

@interface MBModelsListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MBModelsListDataController *dataController;
@property (nonatomic, strong) MBModelsListViewModel *listViewModel;

@end

@implementation MBModelsListViewController

- (instancetype)initWithModelsListDataController:(MBModelsListDataController *)dataController {
    self = [self initWithClassNib];
    if (self != nil) {
        self.dataController = dataController;
        self.listViewModel = [MBModelsListViewModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[MBModelsListViewModel reusableCellNib] forCellReuseIdentifier:[MBModelsListViewModel reusableCellIdentifier]];
    
    __weak typeof(self) weakSelf = self;
    [self.dataController fetchModelListItemsWithCompletion:^(BOOL success, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (success == YES) {
            [strongSelf reloadTableView];
        }
        else if (error != nil) {
        }
    }];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MIN(MBMaxItemCount, [self.dataController numberOfDataModels]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *reusableCell = [tableView dequeueReusableCellWithIdentifier:[MBModelsListViewModel reusableCellIdentifier]];
    MBModelsListItemDataModel *dataModel = [self.dataController dataModelAtIndex:indexPath.row];
    [MBModelsListViewModel configureCell:reusableCell withDataModel:dataModel];
    return reusableCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MBModelsListItemDataModel *data = [self.dataController dataModelAtIndex:indexPath.row];
    CGFloat height = [self.listViewModel rowHeightForDataModel:data forWidth:CGRectGetWidth(tableView.bounds)];
    return height;
}

- (void)reloadTableView {
    [self.tableView reloadData];
}

@end
