//
//  YYTextHttpBindingParser.m
//  YYTextDemo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 ibireme. All rights reserved.
//

#import "VV_YYTextHttpBindingParser.h"
#import "NSAttributedString+YYText.h"

@implementation VV_YYTextHttpBindingParser

- (instancetype)init {
    NSString *pattern = @"[a-zA-z]+://[^\\s]*";
    self.regex = [[NSRegularExpression alloc] initWithPattern:pattern options:kNilOptions error:nil];
    return self;
}

- (BOOL)parseText:(NSMutableAttributedString *)text selectedRange:(NSRangePointer)selectedRange {
    
    [_regex enumerateMatchesInString:text.string options:NSMatchingWithoutAnchoringBounds range:text.yy_rangeOfAll usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        if(!result) return;
        NSRange range = result.range;
        if(range.location == NSNotFound || range.length < 1) return;
        
        [text yy_setColor:[UIColor redColor] range:range];
        
        [text yy_setUnderlineStyle:NSUnderlineStyleSingle range:range];
        
        [text yy_setTextHighlightRange:range color:[UIColor grayColor] backgroundColor:[UIColor greenColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            
            if([self.delegate respondsToSelector:@selector(highlightTextActionCallBack:)]) {
                [self.delegate highlightTextActionCallBack:[text attributedSubstringFromRange:range].string];
            }
        }];
    }];
    
    return YES;
}

@end

