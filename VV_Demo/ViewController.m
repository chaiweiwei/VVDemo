//
//  ViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "ViewController.h"
#import "VVExampleController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    VVExampleController *vc = [VVExampleController new];
    [self pushViewController:vc animated:NO];
}
@end
