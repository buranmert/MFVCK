//
//  MBInputFormEnumTypes.h
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

typedef NS_ENUM(NSUInteger, MBInputFieldCellState) {
    MBInputFieldCellStateDefault = 0,
    MBInputFieldCellStateSelected,
    MBInputFieldCellStateValid,
    MBInputFieldCellStateWrong,
};

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
