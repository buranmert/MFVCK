//
//  MBModelsListViewModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListViewModel.h"

#import "MBModelsListItemDataModel.h"

#import <UIKit/UILabel.h>
#import "MBModelsListTableViewCell.h"
#import "UIView+MBNib.h"

static NSString * const MBCellIdentifier = @"MBModelListTableViewCellIdentifier";

@interface MBModelsListViewModel ()

@property (nonatomic, strong, readonly) MBModelsListTableViewCell *dummyCell;

@end

@implementation MBModelsListViewModel
@synthesize dummyCell = _dummyCell;

+ (Class)reusableCellClass {
    return [MBModelsListTableViewCell class];
}

+ (UINib *)reusableCellNib {
    UINib *nib = [MBModelsListTableViewCell classNib];
    return nib;
}

+ (NSString *)reusableCellIdentifier {
    return MBCellIdentifier;
}

- (MBModelsListTableViewCell *)dummyCell {
    if (_dummyCell == nil) {
        _dummyCell = [MBModelsListTableViewCell viewWithNib];
    }
    return _dummyCell;
}

- (CGFloat)rowHeightForDataModel:(MBModelsListItemDataModel *)dataModel {
    [MBModelsListViewModel configureCell:self.dummyCell withDataModel:dataModel];
    CGSize size = [self.dummyCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

+ (void)configureCell:(UITableViewCell *)cell withDataModel:(MBModelsListItemDataModel *)dataModel {
    if ([cell isKindOfClass:[MBModelsListTableViewCell class]]) {
        MBModelsListTableViewCell *itemCell = (MBModelsListTableViewCell *)cell;
        itemCell.textLabel.text = dataModel.title;
    }
}

@end
