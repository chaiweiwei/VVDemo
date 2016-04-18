//
//  SqureListViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/12.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "SqureListViewController.h"
#import "UITool.h"

@implementation SqureListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UITool *ui = [[UITool alloc] init];
    
    CGFloat tagW = ([UIScreen mainScreen].bounds.size.width - 32 - 12)/5.0;
    
    for (int i = 0 ; i < 8; i ++) {
        CGRect rect = [ui getRectViewInSimpleSquareListUIWithWidth:tagW left:16 lineSpace:4 column:5 index:i];
        UIView *view = [self createViewWithRect:rect];
        
        [self.view addSubview:view];
    }
    
    //NSLog(@"%@",testi)
}

- (UIView *)createViewWithRect:(CGRect)rect{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = rect;
    return view;
}
@end
