//
//  MBModelsListViewModel.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListViewModel.h"

#import "MBModelsListItemDataModel.h"

#import "MBModelsListTableViewCell.h"
#import "UIView+MBNib.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

static NSString * const MBCellIdentifier = @"MBModelListTableViewCellIdentifier";
static CGFloat const MBMinRowHeight = 60.f;

@interface MBModelsListViewModel ()

@property (nonatomic, strong, readonly) MBModelsListTableViewCell *dummyCell;

@end

@implementation MBModelsListViewModel
@synthesize dummyCell = _dummyCell;

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

- (CGFloat)rowHeightForDataModel:(MBModelsListItemDataModel *)dataModel forWidth:(CGFloat)maxWidth {
    CGRect frame = self.dummyCell.frame;
    frame.size.width = maxWidth;
    [self.dummyCell setFrame:frame];
    
    [MBModelsListViewModel configureCell:self.dummyCell withDataModel:dataModel];
    CGSize size = [self.dummyCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return MAX(MBMinRowHeight, size.height);
}

+ (void)configureCell:(UITableViewCell *)cell withDataModel:(MBModelsListItemDataModel *)dataModel {
    if ([cell isKindOfClass:[MBModelsListTableViewCell class]]) {
        MBModelsListTableViewCell *itemCell = (MBModelsListTableViewCell *)cell;
        NSURL *imageURL = [NSURL URLWithString:dataModel.small_thumbnail.url];
        [itemCell.thumbnailImageView setImageWithURL:imageURL];
        itemCell.modelNameLabel.text = dataModel.name;
        
        [itemCell updateConstraintsIfNeeded];
        [itemCell layoutIfNeeded];
    }
}

@end
