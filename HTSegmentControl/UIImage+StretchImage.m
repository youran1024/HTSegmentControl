//
//  UIImage+StretchImage.m
//  HTAlertView
//
//  Created by Mr.Yang on 13-12-11.
//  Copyright (c) 2013年 MoonLightCompany. All rights reserved.
//

#import "UIImage+StretchImage.h"

@implementation UIImage (StretchImage)

- (UIImage *)autoStretchImage
{
    CGSize size = self.size;
    return [self stretchableImageWithLeftCapWidth:size.width / 2.0f topCapHeight:size.height / 2.0f];
}

- (UIImage *)stretchImage:(CGFloat)width andHeight:(CGFloat)height
{
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

@end
