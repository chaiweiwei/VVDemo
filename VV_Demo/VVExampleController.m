//
//  VVExampleController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "VVExampleController.h"
#import "TestModel.h"

@interface VVExampleController()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end


@implementation VVExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidenLoadingView = YES;
    
    self.title = @"VV Demo";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    [self addCell:@"正则表达 点击事件" class:@"UrlRegexViewController"];
    [self addCell:@"webView" class:@"WebViewController"];
    [self addCell:@"规则Rect列表" class:@"SqureListViewController"];
    [self addCell:@"UILabel的计算" class:@"LabelSizeViewController"];
    [self addCell:@"UIImageView model" class:@"UiimageModelViewController"];
    [self addCell:@"Mantle NSNull" class:@"MantleTextViewController"];
    [self addCell:@"UI空间封装demo" class:@"SimpleSelectionViewController"];
    [self.tableView reloadData];
    
    [self test];
}


- (void)test
{
//    NSString const *name = @"name";//内存空间的值不能变
//    NSString *const name2 = @"name2";//指针指向的地址不能变
//    
//    NSString *a = @"a";
//    NSString *b = @"b";
//    
//    name = a;//修改的是指针地址
//    //    *name = b;//修改的是内存空间的值
    
//    TestModel *const model1 = [TestModel new];//测试得出TestModel const *model1 这样没有意义。
//    model1.number = @(99);
//    TestModel *model2 = [TestModel new];
//    model2.number = @(100);
//    
//    model1 = model2;
    
    NSLog(@"");
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end