//
//  MBModelsListTableViewCell.m
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBModelsListTableViewCell.h"

@implementation MBModelsListTableViewCell

//workaround for autoresizing cell trick
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat availableLabelWidth = CGRectGetWidth(self.modelNameLabel.bounds);
    self.modelNameLabel.preferredMaxLayoutWidth = availableLabelWidth;
    [super layoutSubviews];
}

@end
