//
//  MBInputFieldTableViewCell.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseTableViewCell.h"

@class MBTextField;
@class MBLabel;

@interface MBInputFieldTableViewCell : MBBaseTableViewCell

@property (weak, nonatomic) IBOutlet MBLabel *titleLabel;
@property (weak, nonatomic) IBOutlet MBTextField *inputTextField;

@end
