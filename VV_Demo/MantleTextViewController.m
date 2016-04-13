//
//  MantleTextViewController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/13.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "MantleTextViewController.h"
#import "TestModel.h"

@interface MantleTextViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation MantleTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic = @{@"title":[NSNull null]};
    
    TestModel *model = [MTLJSONAdapter modelOfClass:[TestModel class] fromJSONDictionary:dic error:nil];
   
//    model.title = nil;
    
    if([model.title isEqual:[NSNull null]]){
        self.testLabel.text = [NSString stringWithFormat:@"(NSNull)测试 状态= %@",model.title];
    }else if(model.title.length > 0) {
         self.testLabel.text = [NSString stringWithFormat:@"%@",model.title];
    }else {
        self.testLabel.text = [NSString stringWithFormat:@"(nil)测试 状态= %@",model.title];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
