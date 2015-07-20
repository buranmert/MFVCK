//
//  MBFormInputFieldsViewModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGeometry.h>
#import "MBInputFormEnumTypes.h"

@class MBFormInputFieldsViewModel;
@class MBInputFieldTableViewCell;

@protocol MBFormInputFieldsViewModelDelegate <NSObject>

@optional
- (void)formInputFieldsViewModel:(MBFormInputFieldsViewModel *)sender changedState:(MBInputFormState)inputFormState;
- (void)formInputFieldsViewModelWantsToComplete:(MBFormInputFieldsViewModel *)sender;

@end

@interface MBFormInputFieldsViewModel : NSObject

/*
 add input fields from view controller and then leave their view logic to view model
 */
- (void)addInputFieldCell:(MBInputFieldTableViewCell *)inputFieldCell withTitle:(NSString *)title withType:(MBInputFieldType)inputFieldType;

/*
 height of input field cells are variable according to their content, therefore that should be decided by view model
 */
- (CGFloat)heightForInputFieldCell;

/*
 deploy data to achieve "remember me" functionality
 */
- (void)setInputString:(NSString *)inputString forInputFieldType:(MBInputFieldType)inputFieldType;
- (NSString *)inputStringForInputFieldType:(MBInputFieldType)inputFieldType;

/*
 take security measures in this method
 */
- (void)formViewWillDisappear;

@property (nonatomic, weak) id<MBFormInputFieldsViewModelDelegate> delegate;

@end
