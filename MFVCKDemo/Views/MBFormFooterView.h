//
//  MBLoginFormFooterView.h
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <UIKit/UIView.h>

@class UISwitch;
@class MBLabel;
@class MBButton;

@interface MBFormFooterView : UIView

@property (weak, nonatomic) IBOutlet MBButton *button;
@property (weak, nonatomic) IBOutlet MBLabel *switchLabel;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;

@end
