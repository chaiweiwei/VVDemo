//
//  UILabel+VerticalUpAlignment.m
//  bcy
//
//  Created by chaiweiwei on 16/1/28.
//  Copyright © 2016年 mirroon. All rights reserved.
//

#import "UILabel+VerticalUpAlignment.h"

@implementation UILabel (VerticalUpAlignment)

//水平垂直居中
- (void)verticalUpAlignmentWithText:(NSString *)text lineSpace:(CGFloat)space maxHeight:(CGFloat)maxHeight {
    
    if(text.length <= 0) {
        self.text = text;
    }

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:space];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    
    CGRect frame = self.frame;
    CGSize size = [attributedString boundingRectWithSize:CGSizeMake(frame.size.width, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    frame.size = CGSizeMake(frame.size.width, size.height);
    self.frame = frame;
    self.attributedText = attributedString;
}

//只有一行的时候不使用行距
- (void)setLineSpaceWithText:(NSString *)text lineSpace:(CGFloat)space maxWidth:(CGFloat)maxWidth {
    if(text.length <= 0) {
        self.text = text;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setLineSpacing:space];
    
    //计算单行高度
    NSMutableDictionary *dic = [@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:self.font} mutableCopy];
    
    CGSize mutiRowSize = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[dic copy] context:nil].size;
    CGSize rowSize = [text sizeWithAttributes:dic];
    
    if(mutiRowSize.height <= rowSize.height) {
        [paragraphStyle setLineSpacing:0];
        [self setLineSpaceWithText:text lineSpace:0];
    }else {
        [self setLineSpaceWithText:text lineSpace:space];
    }
    
}
//忽略行距
- (void)setLineSpaceWithText:(NSString *)text lineSpace:(CGFloat)space{
    if(text.length <= 0) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    
    self.attributedText = attributedString;
}

- (void)setAttributedTextWithColor:(NSString *)text attributeText:(NSString *)attributeText color:(UIColor *)color{
    if(text.length <= 0) {
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[text rangeOfString:attributeText]];
    
    self.attributedText = attributedString;
}

- (void)setAttributedTextWithFont:(NSString *)text attributeText:(NSString *)attributeText font:(CGFloat)font{
    if(text.length <= 0) {
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:[text rangeOfString:attributeText]];
    
    self.attributedText = attributedString;
}


@end
