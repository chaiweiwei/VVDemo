//
//  LabelSizeViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/12.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "LabelSizeViewController.h"
#import "UILabel+VerticalUpAlignment.h"

@interface LabelSizeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation LabelSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"当lineBreakMode是NSLineBreakByTruncatingTail的时候高度计算失效，行距设置失效。当lineBreakMode是NSLineBreakByTruncatingTail的时候高度计算失效，行距设置失效。当lineBreakMode是NSLineBreakByTruncatingTail的时候高度计算失效，行距设置失效。当lineBreakMode是NSLineBreakByTruncatingTail。";
    
    [self.label1 setLineSpaceWithText:string lineSpace:5 maxWidth:self.view.frame.size.width];

    self.label2.text = @"当lineBreakMode是";
    
    NSInteger count = [self.label1 lineCountWithMaxWidth:[UIScreen mainScreen].bounds.size.width lineSpace:5];
    NSLog(@"label1 有 %ld行",(long)count);
    
    count = [self.label2 lineCountWithMaxWidth:[UIScreen mainScreen].bounds.size.width];
    NSLog(@"label2 有 %ld行",(long)count);
    
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
