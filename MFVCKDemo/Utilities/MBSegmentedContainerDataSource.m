//
//  MBSegmentedContainerDataSource.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBSegmentedContainerDataSource.h"
#import "MBModelsListViewController.h"
#import "MBModelsListDataController.h"

typedef NS_ENUM(NSUInteger, MBModelsListViewControllerType) {
    MBModelsListViewControllerTypePublic = 0,
    MBModelsListViewControllerTypePrivate,
};

static NSString * const MBModelsListPublicTitleKey = @"Public";
static NSString * const MBModelsListPrivateTitleKey = @"Private";

static NSUInteger const MBChildViewControllerCount = 2;

@interface MBSegmentedContainerDataSource ()

@property (nonatomic, strong) NSMutableArray *childViewControllersArray;

@end

@implementation MBSegmentedContainerDataSource

- (NSMutableArray *)childViewControllersArray {
    if (_childViewControllersArray == nil) {
        _childViewControllersArray = [NSMutableArray array];
        for (NSUInteger i = 0; i < MBChildViewControllerCount; i++) {
            [_childViewControllersArray addObject:[NSNull null]];
        }
    }
    return _childViewControllersArray;
}

#pragma mark - MBSegmentedContainerDataSourceProtocol methods

- (NSUInteger)numberOfChildViewControllers {
    return MBChildViewControllerCount;
}

- (NSString *)titleForChildViewControllerAtIndex:(NSUInteger)index {
    MBModelsListViewControllerType controllerType = [MBSegmentedContainerDataSource controllerTypeForIndex:index];
    NSString *title = [MBSegmentedContainerDataSource titleForListViewControllerType:controllerType];
    return title;
}

- (UIViewController *)childViewControllerAtIndex:(NSUInteger)index {
    MBModelsListViewControllerType controllerType = [MBSegmentedContainerDataSource controllerTypeForIndex:index];
    UIViewController *viewController = [self viewControllerForType:controllerType];
    return viewController;
}

- (UIViewController *)viewControllerForType:(MBModelsListViewControllerType)type {
    id viewController = [self.childViewControllersArray objectAtIndex:type];
    if ([viewController isKindOfClass:[UIViewController class]] == NO) {
        MBModelsListDataController *dataController = nil;
        switch (type) {
            case MBModelsListViewControllerTypePublic: {
                dataController = [[MBModelsListDataController alloc] initWithModelsListType:MBModelsListTypePublic];
                break;
            }
            case MBModelsListViewControllerTypePrivate: {
                dataController = [[MBModelsListDataController alloc] initWithModelsListType:MBModelsListTypePrivate];
                break;
            }
        }
        viewController = [[MBModelsListViewController alloc] initWithModelsListDataController:dataController];
        [self.childViewControllersArray replaceObjectAtIndex:type withObject:viewController];
    }
    return viewController;
}

+ (MBModelsListViewControllerType)controllerTypeForIndex:(NSUInteger)index {
    MBModelsListViewControllerType type;
    switch (index) {
        case 0: {
            type = MBModelsListViewControllerTypePublic;
            break;
        }
        case 1: {
            type = MBModelsListViewControllerTypePrivate;
            break;
        }
        default:
            type = MBModelsListViewControllerTypePublic;
            break;
    }
    return type;
}

+ (NSString *)titleForListViewControllerType:(MBModelsListViewControllerType)type {
    NSString *title = nil;
    switch (type) {
        case MBModelsListViewControllerTypePublic: {
            title = NSLocalizedString(MBModelsListPublicTitleKey, @"Segmented control page");
            break;
        }
        case MBModelsListViewControllerTypePrivate: {
            title = NSLocalizedString(MBModelsListPrivateTitleKey, @"Segmented control page");
            break;
        }
    }
    return title;
}

@end
