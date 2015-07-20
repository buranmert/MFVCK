//
//  MBStyling.h
//  MFVCKDemo
//
//  Created by Mert Buran on 17/07/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

/*
 centralized declerative styling class
 */
@interface MBStyling : NSObject

+ (UIColor *)defaultTextColor;
+ (UIColor *)selectedTextColor;
+ (UIColor *)validTextColor;
+ (UIColor *)wrongTextColor;

@end
