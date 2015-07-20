//
//  MBSegmentedContainerViewController.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseViewController.h"
#import "MBSegmentedContainerDataSourceProtocol.h"

@interface MBSegmentedContainerViewController : MBBaseViewController

@property (nonatomic, weak) IBOutlet id<MBSegmentedContainerDataSourceProtocol> dataSource;

@end
