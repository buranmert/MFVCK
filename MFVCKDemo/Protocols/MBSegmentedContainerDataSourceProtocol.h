//
//  MBSegmentedContainerDataSource.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@protocol MBSegmentedContainerDataSourceProtocol <NSObject>

/*
 title to be shown on segmented contol buttons
 */
- (NSString *)titleForChildViewControllerAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfChildViewControllers;
- (UIViewController *)childViewControllerAtIndex:(NSUInteger)index;

@end
