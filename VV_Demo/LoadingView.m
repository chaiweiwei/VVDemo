//
//  LoadingView.m
//  bcy
//
//  Created by 林泽豪 on 15/8/5.
//  Copyright (c) 2015年 mirroon. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView {
    UIImageView * loadingImage;
}

- (void)showInView:(UIView *)view {
    //[UIScreen mainScreen].bounds.size.width/2 - 26
    //[UIScreen mainScreen].bounds.size.height/2 - 46
    self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 26, view.frame.size.height/2 - 46 - 64, 52, 92);
    [view addSubview:self];
    loadingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 52, 92)];
    [self addSubview:loadingImage];
    
    NSMutableArray* array = [NSMutableArray array];
    for (int i = 1; i < 15; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"Loading_%d.png", i]];
        [array addObject:image];
    }
    [loadingImage setAnimationImages:array];
    [loadingImage setAnimationDuration:1.008];
    [loadingImage setAnimationRepeatCount:0];
    [loadingImage startAnimating];
}

- (void)showInViewController:(UIViewController *)controller {
    if (controller.navigationController.navigationBar.hidden) {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 26, controller.view.frame.size.height/2 - 46, 52, 92);
    } else {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 26, controller.view.frame.size.height/2 - 46 - 64, 52, 92);
    }
    [controller.view addSubview:self];
    loadingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 52, 92)];
    [self addSubview:loadingImage];
    
    NSMutableArray* array = [NSMutableArray array];
    for (int i = 1; i < 15; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"Loading_%d.png", i]];
        [array addObject:image];
    }
    [loadingImage setAnimationImages:array];
    [loadingImage setAnimationDuration:1.008];
    [loadingImage setAnimationRepeatCount:0];
    [loadingImage startAnimating];
}

- (void)hide {
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
