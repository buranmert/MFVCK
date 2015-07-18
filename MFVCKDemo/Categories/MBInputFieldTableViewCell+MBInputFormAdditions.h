//
//  MBInputFieldTableViewCell+MBInputFormAdditions.h
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBInputFieldTableViewCell.h"
#import "MBInputFormEnumTypes.h"

@interface MBInputFieldTableViewCell (MBInputFormAdditions)

@property (nonatomic, assign) MBInputFieldType inputFieldType;
@property (nonatomic, assign, getter=isValid) BOOL valid;

@end
