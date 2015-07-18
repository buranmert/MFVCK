//
//  MBFormFooterViewModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 18/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBFormFooterViewModel;
@class MBFormFooterView;

typedef NS_ENUM(NSUInteger, MBFormFooterViewState) {
    MBFormFooterViewStateDisabled = 1,
    MBFormFooterViewStateEnabled,
};

@protocol MBFormFooterViewModelDelegate <NSObject>

@optional
- (void)footerViewButtonTapped:(MBFormFooterViewModel *)sender;

@end

@interface MBFormFooterViewModel : NSObject

- (instancetype)initWithFooterView:(MBFormFooterView *)footerView;

@property (nonatomic, assign) MBFormFooterViewState footerViewState;
@property (nonatomic, assign, readonly, getter=isSwitchOn) BOOL switchOn;
@property (nonatomic, weak) id<MBFormFooterViewModelDelegate> delegate;

@end
