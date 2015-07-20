//
//  MBModelsListViewModel.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UINib.h>

@class MBModelsListItemDataModel;
@class UITableViewCell;

@interface MBModelsListViewModel : NSObject

+ (UINib *)reusableCellNib;
+ (NSString *)reusableCellIdentifier;
+ (void)configureCell:(UITableViewCell *)cell withDataModel:(MBModelsListItemDataModel *)dataModel;
- (CGFloat)rowHeightForDataModel:(MBModelsListItemDataModel *)dataModel forWidth:(CGFloat)maxWidth;

@end
