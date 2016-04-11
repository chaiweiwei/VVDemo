//
//  UILabel+VerticalUpAlignment.h
//  bcy
//
//  Created by chaiweiwei on 16/1/28.
//  Copyright © 2016年 mirroon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (VerticalUpAlignment)

//顶部垂直居中
- (void)verticalUpAlignmentWithText:(NSString *)text lineSpace:(CGFloat)space maxHeight:(CGFloat)maxHeight;
//只有一行的时候不使用行距
- (void)setLineSpaceWithText:(NSString *)text lineSpace:(CGFloat)space maxWidth:(CGFloat)maxWidth;

- (void)setAttributedTextWithColor:(NSString *)text attributeText:(NSString *)attributeText color:(UIColor *)color;

- (void)setAttributedTextWithFont:(NSString *)text attributeText:(NSString *)attributeText font:(CGFloat)font;

@end
