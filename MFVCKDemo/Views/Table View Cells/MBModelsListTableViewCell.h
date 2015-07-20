//
//  MBModelsListTableViewCell.h
//  MFVCKDemo
//
//  Created by Mert Buran on 20/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "MBBaseTableViewCell.h"
#import "MBLabel.h"

@interface MBModelsListTableViewCell : MBBaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet MBLabel *modelNameLabel;


@end
