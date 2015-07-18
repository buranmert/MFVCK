//
//  MBFormInputFieldsViewModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBFormInputFieldsViewModel.h"
#import "MBInputFieldTableViewCell.h"
#import "MBTextField.h"
#import "MBLabel.h"

#import "MBStyling.h"

typedef NS_ENUM(NSUInteger, MBInputFieldCellState) {
    MBInputFieldCellStateDefault = 0,
    MBInputFieldCellStateSelected,
    MBInputFieldCellStateValid,
    MBInputFieldCellStateWrong,
};

@interface MBInputFieldCellWrapper : NSObject

@property (nonatomic, strong, readonly) MBInputFieldTableViewCell *cell;
@property (nonatomic, assign, readonly) MBInputFieldType type;

@end

@implementation MBInputFieldCellWrapper

- (instancetype)initWithCell:(MBInputFieldTableViewCell *)cell type:(MBInputFieldType)type {
    self = [super init];
    if (self != nil) {
        _cell = cell;
        _type = type;
        switch (type) {
            case MBInputFieldTypeDefault:
            case MBInputFieldTypeUsername: {
                [cell.inputTextField setReturnKeyType:UIReturnKeyNext];
                [cell.inputTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                break;
            }
            case MBInputFieldTypePassword: {
                [cell.inputTextField setReturnKeyType:UIReturnKeySend];
                [cell.inputTextField setSecureTextEntry:YES];
                [cell.inputTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
                break;
            }
        }
    }
    return self;
}

@end

static CGFloat const MBInputFieldCellRowHeight = 80.f;

@interface MBFormInputFieldsViewModel () <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *inputFieldCellWrappers;

@end

@implementation MBFormInputFieldsViewModel

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self.inputFieldCellWrappers = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addInputFieldCell:(MBInputFieldTableViewCell *)inputFieldCell withType:(MBInputFieldType)inputFieldType {
    MBTextField *inputTextField = inputFieldCell.inputTextField;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:inputTextField];
    inputTextField.delegate = self;
    MBInputFieldCellWrapper *wrapper = [[MBInputFieldCellWrapper alloc] initWithCell:inputFieldCell type:inputFieldType];
    [self.inputFieldCellWrappers addObject:wrapper];
}

- (CGFloat)heightForInputFieldCell {
    return MBInputFieldCellRowHeight;
}

+ (void)setInputFieldCellWrapper:(MBInputFieldCellWrapper *)wrapper state:(MBInputFieldCellState)state {
    switch (state) {
        case MBInputFieldCellStateDefault: {
            [wrapper.cell.titleLabel setTextColor:[MBStyling defaultTextColor]];
            break;
        }
        case MBInputFieldCellStateSelected: {
            [wrapper.cell.titleLabel setTextColor:[MBStyling selectedTextColor]];
            break;
        }
        case MBInputFieldCellStateValid: {
            [wrapper.cell.titleLabel setTextColor:[MBStyling validTextColor]];
            break;
        }
        case MBInputFieldCellStateWrong: {
            [wrapper.cell.titleLabel setTextColor:[MBStyling wrongTextColor]];
            break;
        }
    }
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(MBTextField *)textField {
    MBInputFieldType inputFieldType = [self inputFieldTypeForTextField:textField];
    switch (inputFieldType) {
        case MBInputFieldTypeDefault: {
            [textField resignFirstResponder];
            break;
        }
        case MBInputFieldTypeUsername: {
            MBInputFieldTableViewCell *passwordInputFieldCell = [self inputFieldCellForInputFieldType:MBInputFieldTypePassword];
            MBTextField *passwordTextField = passwordInputFieldCell.inputTextField;
            [passwordTextField becomeFirstResponder];
            break;
        }
        case MBInputFieldTypePassword: {
            [textField resignFirstResponder];
            if ([self.delegate respondsToSelector:@selector(formInputFieldsViewModelWantsToComplete:)]) {
                [self.delegate formInputFieldsViewModelWantsToComplete:self];
            }
            break;
        }
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //todo Formatter
    return YES;
}

- (void)textFieldTextDidChange:(NSNotification *)notification {
    static MBInputFormState previousInputFormState = NSNotFound;
    MBInputFormState inputFormState = [self validateInputForm];
    if (previousInputFormState != inputFormState && [self.delegate respondsToSelector:@selector(formInputFieldsViewModel:changedState:)]) {
        [self.delegate formInputFieldsViewModel:self changedState:inputFormState];
    }
    previousInputFormState = inputFormState;
}

#pragma mark - Private

- (MBInputFormState)validateInputForm {
    //todo
    return MBInputFormStateValid;
}

- (MBInputFieldType)inputFieldTypeForTextField:(MBTextField *)textField {
    for (MBInputFieldCellWrapper *wrapper in self.inputFieldCellWrappers) {
        if ([textField isEqual:wrapper.cell.inputTextField]) {
            return wrapper.type;
        }
    }
    return MBInputFieldTypeDefault;
}

- (MBInputFieldTableViewCell *)inputFieldCellForInputFieldType:(MBInputFieldType)inputFieldType {
    for (MBInputFieldCellWrapper *wrapper in self.inputFieldCellWrappers) {
        if (wrapper.type == inputFieldType) {
            return wrapper.cell;
        }
    }
    return nil;
}

@end
