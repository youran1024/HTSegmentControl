//
//  HTSegmentControl.h
//  HTSegmentControl
//
//  Created by Mr.Yang on 13-12-11.
//  Copyright (c) 2013年 MoonLightCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTSegmentControl : UIView
{
    __strong UIImage *_leftImage;
    __strong UIImage *_rightImage;
    __strong UIImage *_middleImage;
}

@property (nonatomic, strong)   UIImage *leftImage;
@property (nonatomic, strong)   UIImage *middleImage;
@property (nonatomic, strong)   UIImage *rightImage;
@property (nonatomic, strong)   NSArray *items;

@property (nonatomic, assign)   UIEdgeInsets edgeInsets;
@property (nonatomic, strong)   UIColor *selectedColor;
@property (nonatomic, copy)     void(^buttonClickBlock)(HTSegmentControl *control, UIButton *button, NSInteger index);

@end
