//
//  UIImage+StretchImage.h
//  HTAlertView
//
//  Created by Mr.Yang on 13-12-11.
//  Copyright (c) 2013年 MoonLightCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HTStretchImageAuto(imageName) [[UIImage imageNamed:imageName] autoStretchImage]
#define HTStretchImage(imageName, width, height) [[UIImage imageNamed:imageName] stretchImage:width andHeight:height]

@interface UIImage (StretchImage)
- (UIImage *)autoStretchImage;
- (UIImage *)stretchImage:(CGFloat)width andHeight:(CGFloat)height;
@end
