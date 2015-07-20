//
//  MBLoginFormViewController.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBLoginFormViewController.h"

#import <UIKit/UITableView.h>
#import "MBInputFieldTableViewCell.h"
#import "MBFormFooterView.h"
#import "UIView+MBNib.h"

#import "MBFormInputFieldsViewModel.h"
#import "MBFormFooterViewModel.h"

#import "MBLoginDataController.h"

static NSInteger const MBLoginFormInputFieldsCount = 2;
static CGFloat const MBFormTableViewHorizontalInset = 15.f;
static CGFloat const MBFormTableViewVerticalInset = 0.f;

static NSString * const MBSegueIdentifier = @"goToItemsListSegue";

static NSString * const MBUsernameTitleKey = @"Username";
static NSString * const MBPasswordTitleKey = @"Password";

@interface MBLoginFormViewController () <UITableViewDelegate, UITableViewDataSource, MBFormFooterViewModelDelegate, MBFormInputFieldsViewModelDelegate>

@property (nonatomic, strong) MBInputFieldTableViewCell *usernameInputFieldCell;
@property (nonatomic, strong) MBInputFieldTableViewCell *passwordInputFieldCell;
@property (nonatomic, strong) MBFormFooterView *formFooterView;

@property (nonatomic, strong) MBFormInputFieldsViewModel *formInputFieldsViewModel;
@property (nonatomic, strong) MBFormFooterViewModel *formFooterViewModel;

@property (nonatomic, strong) MBLoginDataController *dataController;

@end

@implementation MBLoginFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableViewInsets = UIEdgeInsetsMake(MBFormTableViewVerticalInset, MBFormTableViewHorizontalInset, MBFormTableViewVerticalInset, MBFormTableViewHorizontalInset);
    
    self.formInputFieldsViewModel = [MBFormInputFieldsViewModel new];
    self.formInputFieldsViewModel.delegate = self;
    self.usernameInputFieldCell = [MBInputFieldTableViewCell viewWithNib];
    self.passwordInputFieldCell = [MBInputFieldTableViewCell viewWithNib];
    NSString *usernameTitle = NSLocalizedString(MBUsernameTitleKey, @"Login page");
    NSString *passwordTitle = NSLocalizedString(MBPasswordTitleKey, @"Login page");
    [self.formInputFieldsViewModel addInputFieldCell:self.usernameInputFieldCell withTitle:usernameTitle withType:MBInputFieldTypeUsername];
    [self.formInputFieldsViewModel addInputFieldCell:self.passwordInputFieldCell withTitle:passwordTitle withType:MBInputFieldTypePassword];
    
    NSString *rememberedUsername = [self.dataController rememberedUsername];
    if (rememberedUsername.length > 0) {
        [self.formInputFieldsViewModel setInputString:rememberedUsername forInputFieldType:MBInputFieldTypeUsername];
    }
    
    self.formFooterView = [MBFormFooterView viewWithNib];
    self.formFooterViewModel = [[MBFormFooterViewModel alloc] initWithFooterView:self.formFooterView];
    self.formFooterViewModel.delegate = self;
    [self.tableView setTableFooterView:self.formFooterView];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setAllowsSelection:NO];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.formInputFieldsViewModel formViewWillDisappear];
}

- (MBLoginDataController *)dataController {
    if (_dataController == nil) {
        _dataController = [MBLoginDataController new];
    }
    return _dataController;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 0 ? self.usernameInputFieldCell : self.passwordInputFieldCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MBLoginFormInputFieldsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.formInputFieldsViewModel heightForInputFieldCell];
}

#pragma mark - MBFormFooterViewDelegate methods

- (void)footerViewButtonTapped:(MBFormFooterViewModel *)sender {
    [self submitForm];
}

#pragma mark - MBFormInputFieldsViewModelDelegate methods

- (void)formInputFieldsViewModel:(MBFormInputFieldsViewModel *)sender changedState:(MBInputFormState)inputFormState {
    switch (inputFormState) {
        case MBInputFormStateDefault:
        case MBInputFormStateInvalid: {
            [self.formFooterViewModel setFooterViewState:MBFormFooterViewStateDisabled];
            break;
        }
        case MBInputFormStateValid: {
            [self.formFooterViewModel setFooterViewState:MBFormFooterViewStateEnabled];
            break;
        }
    }
}

- (void)formInputFieldsViewModelWantsToComplete:(MBFormInputFieldsViewModel *)sender {
    MBFormFooterViewState footerViewState = self.formFooterViewModel.footerViewState;
    switch (footerViewState) {
        case MBFormFooterViewStateDisabled: {
            break;
        }
        case MBFormFooterViewStateEnabled: {
            [self submitForm];
            break;
        }
    }
}

#pragma mark - Actions

- (void)submitForm {
    NSString *username = [self.formInputFieldsViewModel inputStringForInputFieldType:MBInputFieldTypeUsername];
    NSString *password = [self.formInputFieldsViewModel inputStringForInputFieldType:MBInputFieldTypePassword];
    MBLoginRequestModel *requestData = [[MBLoginRequestModel alloc] initWithUsername:username password:password];
    MBLoginOption loginOptions = [self.formFooterViewModel isSwitchOn] ? MBLoginOptionStaySignedIn : MBLoginOptionDefault;
    __weak typeof(self) weakSelf = self;
    MBHTTPRequestOperation *operation = [self.dataController
                                         loginWithLoginRequest:requestData
                                         loginOptions:loginOptions
                                         completion:^(BOOL success, NSError *error) {
                                             __strong typeof(weakSelf) strongSelf = weakSelf;
                                             if (success) {
                                                 [strongSelf performSegueWithIdentifier:MBSegueIdentifier sender:strongSelf];
                                             }
                                             else if (error != nil) {
                                                 [strongSelf showErrorViewWithMessage:error.localizedDescription];
                                             }
                                         }];
    [self showLoadingViewWithOperation:operation];
}

@end
