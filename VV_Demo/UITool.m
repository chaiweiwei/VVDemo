//
//  UI.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/12.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "UITool.h"
@implementation UITool

- (CGRect)getRectViewInSimpleSquareListUIWithWidth:(CGFloat)width left:(CGFloat)left lineSpace:(CGFloat)lineSpace column:(NSInteger)column index:(NSInteger)index{
    CGFloat x = 0;
    CGFloat y = 0;
    
    if(index % column == 0) {
        x = left;
    }else {
        x = (width + lineSpace)*(index%column);
        x += left;
    }
    
    y = (width + lineSpace)*(index/column);

    return CGRectMake(x, y, width, width);
}
@end
