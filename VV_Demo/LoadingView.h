//
//  LoadingView.h
//  bcy
//
//  Created by 林泽豪 on 15/8/5.
//  Copyright (c) 2015年 mirroon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

- (void)showInView:(UIView *)view;

- (void)showInViewController:(UIViewController *)controller;

- (void)hide;

@end
