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

#import "MBInputFieldTableViewCell+MBInputFormAdditions.h"
#import "MBInputFormValidator.h"

static CGFloat const MBInputFieldCellRowHeight = 80.f;

@interface MBFormInputFieldsViewModel () <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *inputFieldCells;

@end

@implementation MBFormInputFieldsViewModel

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self.inputFieldCells = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addInputFieldCell:(MBInputFieldTableViewCell *)inputFieldCell withTitle:(NSString *)title withType:(MBInputFieldType)inputFieldType {
    [MBFormInputFieldsViewModel configureInputFieldCell:inputFieldCell type:inputFieldType];
    inputFieldCell.inputFieldType = inputFieldType;
    [self.inputFieldCells addObject:inputFieldCell];
    
    inputFieldCell.titleLabel.text = title;
    
    MBTextField *inputTextField = inputFieldCell.inputTextField;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:inputTextField];
    inputTextField.delegate = self;
    [inputFieldCell setValid:[MBInputFormValidator isValidString:inputTextField.text forInputType:inputFieldType]];
}

- (CGFloat)heightForInputFieldCell {
    return MBInputFieldCellRowHeight;
}

- (void)setInputString:(NSString *)inputString forInputFieldType:(MBInputFieldType)inputFieldType {
    MBInputFieldTableViewCell *cell = [self inputFieldCellForInputFieldType:inputFieldType];
    MBTextField *textField = cell.inputTextField;
    textField.text = inputString;
#warning probably an iOS bug: no notification fired after setText:
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:textField];
    [self textFieldDidEndEditing:textField];
}

- (NSString *)inputStringForInputFieldType:(MBInputFieldType)inputFieldType {
    MBInputFieldTableViewCell *cell = [self inputFieldCellForInputFieldType:inputFieldType];
    return cell.inputTextField.text;
}

- (void)formViewWillDisappear {
    [self setInputString:nil forInputFieldType:MBInputFieldTypePassword];
}

+ (void)setInputFieldCell:(MBInputFieldTableViewCell *)cell state:(MBInputFieldCellState)state {
    switch (state) {
        case MBInputFieldCellStateDefault: {
            [cell.titleLabel setTextColor:[MBStyling defaultTextColor]];
            break;
        }
        case MBInputFieldCellStateSelected: {
            [cell.titleLabel setTextColor:[MBStyling selectedTextColor]];
            break;
        }
        case MBInputFieldCellStateValid: {
            [cell.titleLabel setTextColor:[MBStyling validTextColor]];
            break;
        }
        case MBInputFieldCellStateWrong: {
            [cell.titleLabel setTextColor:[MBStyling wrongTextColor]];
            break;
        }
    }
}

+ (void)configureInputFieldCell:(MBInputFieldTableViewCell *)cell type:(MBInputFieldType)type {
    switch (type) {
        case MBInputFieldTypeDefault: {
            break;
        }
        case MBInputFieldTypeUsername: {
            cell.inputTextField.returnKeyType = UIReturnKeyNext;
            cell.inputTextField.secureTextEntry = NO;
            break;
        }
        case MBInputFieldTypePassword: {
            cell.inputTextField.returnKeyType = UIReturnKeyGo;
            cell.inputTextField.secureTextEntry = YES;
            break;
        }
    }
    cell.inputTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
}

#pragma mark - UITextFieldDelegate methods

- (void)textFieldDidBeginEditing:(MBTextField *)textField {
    MBInputFieldTableViewCell *cell = [self inputFieldCellForTextField:textField];
    [MBFormInputFieldsViewModel setInputFieldCell:cell state:MBInputFieldCellStateSelected];
}

- (void)textFieldDidEndEditing:(MBTextField *)textField {
    MBInputFieldTableViewCell *cell = [self inputFieldCellForTextField:textField];
    MBInputFieldCellState cellState;
    if (cell.isValid) {
        cellState = MBInputFieldCellStateValid;
    }
    else {
        cellState = MBInputFieldCellStateDefault;
    }
    [MBFormInputFieldsViewModel setInputFieldCell:cell state:cellState];
}

- (BOOL)textFieldShouldReturn:(MBTextField *)textField {
    MBInputFieldType inputFieldType = [self inputFieldCellForTextField:textField].inputFieldType;
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

- (void)textFieldTextDidChange:(NSNotification *)notification {
    MBTextField *textField = [notification object];
    MBInputFieldType inputFieldType = [self inputFieldCellForTextField:textField].inputFieldType;
    BOOL isValid = [MBInputFormValidator isValidString:textField.text forInputType:inputFieldType];
    [self setValid:isValid forTextField:textField];
    [self validateInputForm];
}

#pragma mark - Private

- (MBInputFormState)validateInputForm {
    static MBInputFormState previousInputFormState = MBInputFormStateDefault;
    MBInputFormState formState = MBInputFormStateValid;
    for (MBInputFieldTableViewCell *cell in self.inputFieldCells) {
        if ([cell isValid] == NO) {
            formState = MBInputFormStateInvalid;
            break;
        }
    }
    if (previousInputFormState != formState && [self.delegate respondsToSelector:@selector(formInputFieldsViewModel:changedState:)]) {
        previousInputFormState = formState;
        [self.delegate formInputFieldsViewModel:self changedState:formState];
    }
    return formState;
}

- (void)setValid:(BOOL)isValid forTextField:(MBTextField *)textField {
    MBInputFieldTableViewCell *cell = [self inputFieldCellForTextField:textField];
    [cell setValid:isValid];
}

- (MBInputFieldTableViewCell *)inputFieldCellForTextField:(MBTextField *)textField {
    for (MBInputFieldTableViewCell *cell in self.inputFieldCells) {
        if ([textField isEqual:cell.inputTextField]) {
            return cell;
        }
    }
    return nil;
}

- (MBInputFieldTableViewCell *)inputFieldCellForInputFieldType:(MBInputFieldType)inputFieldType {
    for (MBInputFieldTableViewCell *cell in self.inputFieldCells) {
        if (cell.inputFieldType == inputFieldType) {
            return cell;
        }
    }
    return nil;
}

@end
