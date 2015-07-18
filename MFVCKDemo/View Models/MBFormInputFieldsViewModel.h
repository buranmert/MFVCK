//
//  MBFormInputFieldsViewModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGeometry.h>

@class MBFormInputFieldsViewModel;
@class MBInputFieldTableViewCell;

typedef NS_ENUM(NSUInteger, MBInputFieldType) {
    MBInputFieldTypeDefault = 0,
    MBInputFieldTypeUsername,
    MBInputFieldTypePassword,
};

typedef NS_ENUM(NSUInteger, MBInputFormState) {
    MBInputFormStateDefault = 0,
    MBInputFormStateValid,
    MBInputFormStateInvalid,
};

@protocol MBFormInputFieldsViewModelDelegate <NSObject>

@optional
- (void)formInputFieldsViewModel:(MBFormInputFieldsViewModel *)sender changedState:(MBInputFormState)inputFormState;
- (void)formInputFieldsViewModelWantsToComplete:(MBFormInputFieldsViewModel *)sender;

@end

@interface MBFormInputFieldsViewModel : NSObject

- (void)addInputFieldCell:(MBInputFieldTableViewCell *)inputFieldCell withType:(MBInputFieldType)inputFieldType;
- (CGFloat)heightForInputFieldCell;

@property (nonatomic, weak) id<MBFormInputFieldsViewModelDelegate> delegate;

@end
