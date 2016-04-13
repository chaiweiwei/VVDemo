//
//  UiimageModelViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/13.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "UiimageModelViewController.h"
#import <YYWebImage.h>

@interface UiimageModelViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic,strong) NSArray *dataOne;
@property (nonatomic,strong) NSArray *dataTwo;
@end

@implementation UiimageModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *a = nil;
    
    if(a.length > 0) {

        NSLog(@"%@",a);
    }else {
        NSLog(@"[NSNull null]");
    }

    self.dataTwo = self.dataOne = [NSArray arrayWithObjects:@"UIViewContentModeScaleToFill",
                                   @"UIViewContentModeScaleAspectFit",
                                   @"UIViewContentModeScaleAspectFill",
                                   @"UIViewContentModeRedraw",
                                   @"UIViewContentModeCenter",
                                   @"UIViewContentModeTop",
                                   @"UIViewContentModeBottom",
                                   @"UIViewContentModeLeft",
                                   @"UIViewContentModeRight",
                                   @"UIViewContentModeTopLeft",
                                   @"UIViewContentModeTopRight",
                                   @"UIViewContentModeBottomLeft",
                                   @"UIViewContentModeBottomRight",nil];
    //长图
     [self.imageView yy_setImageWithURL:[NSURL URLWithString:@"http://img5.bcyimg.com/drawer/16419/post/177vh/baeb8630011411e6b08e41b4566bdd4a.jpg"] placeholder:nil];
    //短图
    //[self.imageView yy_setImageWithURL:[NSURL URLWithString:@"http://user.bcyimg.com/Public/Upload/avatar/960464/2bb58925ba56446b98ad9ec982bd185b/big.jpg"] placeholder:nil];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == 0) return self.dataOne.count;
    else return self.dataTwo.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0) return self.dataOne[row];
    else return self.dataTwo[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    self.imageView.contentMode = row;
    
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
