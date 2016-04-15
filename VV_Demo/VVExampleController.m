//
//  VVExampleController.m
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import "VVExampleController.h"

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