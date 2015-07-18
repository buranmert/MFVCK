//
//  MBFormFooterViewModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBFormFooterViewModel.h"
#import "MBFormFooterView.h"
#import "MBButton.h"
#import <UIKit/UISwitch.h>

@interface MBFormFooterViewModel ()

@property (nonatomic, weak) MBFormFooterView *footerView;

@end

@implementation MBFormFooterViewModel

- (instancetype)initWithFooterView:(MBFormFooterView *)footerView {
    self = [super init];
    if (self != nil) {
        self.footerView = footerView;
        [self.footerView.button addTarget:self action:@selector(footerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.footerView.onOffSwitch addTarget:self action:@selector(footerSwitchDidChangeValue:) forControlEvents:UIControlEventValueChanged];
        [self setFooterViewState:MBFormFooterViewStateDisabled];
    }
    return self;
}

- (void)footerButtonTapped:(MBButton *)sender {
    if ([self.delegate respondsToSelector:@selector(footerViewButtonTapped:)]) {
        [self.delegate footerViewButtonTapped:self];
    }
}

- (void)footerSwitchDidChangeValue:(UISwitch *)sender {
    
}

- (BOOL)isSwitchOn {
    return self.footerView.onOffSwitch.isOn;
}

- (void)setFooterViewState:(MBFormFooterViewState)footerViewState {
    if (_footerViewState != footerViewState) {
        _footerViewState = footerViewState;
        switch (footerViewState) {
            case MBFormFooterViewStateDisabled: {
                [self.footerView.button setEnabled:NO];
                break;
            }
            case MBFormFooterViewStateEnabled: {
                [self.footerView.button setEnabled:YES];
                break;
            }
        }
    }
}

@end
