//
//  UrlRegexViewController.m
//  YYTextDemo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 ibireme. All rights reserved.
//

#import "UrlRegexViewController.h"
#import "VV_YYTextHttpBindingParser.h"

@interface UrlRegexViewController ()<VV_YYTextBindingParseDelegate>

@end

@implementation UrlRegexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *text = @"链接1 http://www.1.com 链接2 http://www.2.com http://www.3.com";
    YYLabel *label = [YYLabel new];
    label.text = text;
    label.numberOfLines = 0;
    
    VV_YYTextHttpBindingParser *parser = [VV_YYTextHttpBindingParser new];
    parser.delegate = self;

    label.textParser = parser;
    label.frame = self.view.frame;
    [self.view addSubview:label];
}

- (void)highlightTextActionCallBack:(NSString *)text {
    NSLog(@"%@",text);
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
