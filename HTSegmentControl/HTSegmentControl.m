//
//  HTSegmentControl.m
//  HTSegmentControl
//
//  Created by Mr.Yang on 13-12-11.
//  Copyright (c) 2013年 MoonLightCompany. All rights reserved.
//

#import "HTSegmentControl.h"
#import "UIImage+StretchImage.h"

@interface HTSegmentControl()

@property (nonatomic, strong)   NSMutableArray *controls;
@property (nonatomic, unsafe_unretained) UIButton *selectedButton;
@end

@implementation HTSegmentControl

- (void)setItems:(NSArray *)items
{
    if (items == _items) {
        return;
    }
    
    _items = items;
    [_controls removeAllObjects];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self handleButtons];
    [self setSelectedColor:[UIColor blueColor]];
    [self layoutSubviews];
}

- (void)handleButtons
{
    id obj = _items.count > 0 ? _items[0] : nil;
    if ([obj isKindOfClass:[NSString class]]) {
        for (NSInteger i = 0 ; i < _items.count ; i++) {
            obj = [_items objectAtIndex:i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:obj forState:UIControlStateNormal];
            button.tag = i;
            if (i == 0) {
                [button setBackgroundImage:self.leftImage forState:UIControlStateNormal];
            }else if (i == _items.count - 1){
                [button setBackgroundImage:self.rightImage forState:UIControlStateNormal];
            }else {
                [button setBackgroundImage:self.middleImage forState:UIControlStateNormal];
            }
            button.adjustsImageWhenHighlighted = NO;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

            button.autoresizingMask =
            UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleHeight |
            UIViewAutoresizingFlexibleLeftMargin |
            UIViewAutoresizingFlexibleRightMargin;
            
            [self addSubview:button];
            [self.controls addObject:button];
        }
    }
}

#define SegmentHeight   40
- (void)layoutSubviews
{
    CGRect rect;
    CGFloat locationX = 0;
    UIButton *button;
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat segmentWidth = screenWidth / _controls.count;
    
    for (NSInteger i = 0; i < _controls.count; i++) {
        button = [_controls objectAtIndex:i];
        rect = CGRectMake(locationX, 0, segmentWidth, SegmentHeight);
        locationX = CGRectGetMaxX(rect);
        button.frame = rect;
    }
    rect = self.frame;
    rect.size.width = screenWidth;
    rect.size.height = SegmentHeight;
    rect = UIEdgeInsetsInsetRect(rect, _edgeInsets);
    self.frame = rect;
}

- (void)buttonClicked:(UIButton *)button
{
    self.selectedButton = button;
    if (_buttonClickBlock) {
        _buttonClickBlock(self , button, button.tag);
    }
}

- (void)setSelectedButton:(UIButton *)selectedButton
{    if (_selectedButton != selectedButton) {
        [_selectedButton setSelected:NO];
        _selectedButton = selectedButton;
        [_selectedButton setSelected:YES];
    }
}

- (NSMutableArray *)controls
{
    if (!_controls) {
        _controls = [NSMutableArray array];
    }
    return _controls;
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    if (_selectedColor != selectedColor) {
        _selectedColor = selectedColor;
        [self resetSelectedColor];
    }
}

- (void)resetSelectedColor
{
    for (UIButton *button in _controls) {
        if (!_selectedColor) {
            _selectedColor = [UIColor blueColor];
        }
        [button setTitleColor:_selectedColor forState:UIControlStateSelected];
    }

}

- (void)setLeftImage:(UIImage *)leftImage
{
    if (leftImage != _leftImage) {
        _leftImage = leftImage;
        [self setNeedsLayout];
    }
}

- (void)setRightImage:(UIImage *)rightImage
{
    if (_rightImage != rightImage) {
        _rightImage = rightImage;
        [self setNeedsLayout];
    }
}

- (void)setMiddleImage:(UIImage *)middleImage
{
    if (_middleImage != middleImage){
        _middleImage = middleImage;
        [self setNeedsLayout];
    }

}

- (UIImage *)leftImage
{
    if (!_leftImage) {
        _leftImage = HTStretchImageAuto(@"leftImage");
    }
    return _leftImage;
}

- (UIImage *)middleImage
{
    if (!_middleImage) {
        _middleImage = HTStretchImageAuto(@"middleImage");
    }
    return _middleImage;
}

- (UIImage *)rightImage
{
    if (!_rightImage) {
        _rightImage = HTStretchImageAuto(@"rightImage");
    }
    return _rightImage;
}

@end
