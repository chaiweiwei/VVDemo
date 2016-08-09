//
//  QuartzViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/5/27.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "QuartzViewController.h"

#define DegreesToRadians(degrees)(degrees * M_PI / 180)
#define RadiansToDegrees(radians)(radians * 180 / M_PI)

@interface QuartzViewController ()

@end

@implementation QuartzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CATransform3D *transform = CATransform3DMakeTranslation(1, 1, 0);
    transform = CATransform3DTranslate(transform, 1, 1, 0);
    transform = CATransform3DMakeScale(1, 1, 0);
    transform = CATransform3DScale(transform, 1, 1, 0);
    transform = CATransform3DMakeRotation(DegreesToRadians(30), 1, 1, 0);
    transform = CATransform3DRotate(transform, DegreesToRadians(30), 1, 1, 0);
    transform = CATransform3DInvert(transform);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
