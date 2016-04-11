//
//  DataRequestTableViewController.m
//  Spoon
//
//  Created by 曦炽 朱 on 14-9-22.
//  Copyright (c) 2014年 mirroon. All rights reserved.
//

#import "DataRequestTableViewController.h"
#import <MJRefresh.h>
#import "LoadingView.h"

@interface DataRequestTableViewController () {
    
}

@end

@implementation DataRequestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    // Activity Indicator
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = self.activityIndicator.frame;
    frame.origin.x = self.tableView.frame.size.width/2 - frame.size.width / 2;
    frame.origin.y = (self.view.bounds.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.tabBarController.tabBar.frame.size.height - frame.size.height) / 2;
    self.activityIndicator.frame = frame;
    self.activityIndicator.hidesWhenStopped = YES;
    //[self.tableView addSubview:self.activityIndicator];
    [[UIApplication sharedApplication].keyWindow addSubview:self.activityIndicator];
    
    // Pull to refresh
    if (!self.disableHeaderRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    }
    
    if (!self.disableFooterRefresh) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    
    // Load Cache
    self.dataArray = [NSMutableArray arrayWithArray:[self loadCacheArray]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.dataArray.count == 0 && !isGettingData) {
        [self startRequestData];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self.activityIndicator stopAnimating];
}

- (void)startRequestData {
    if (isGettingData) {
        return;
    }
    isGettingData = YES;
    if (self.dataArray.count == 0 && !self.hidenLoadingView) {
        [self.loadingView showInViewController:self];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endRequestData];
    });}

- (LoadingView *)loadingView {
    if(!_loadingView) {
        _loadingView = [[LoadingView alloc] init];
        [_loadingView showInViewController:self];
    }
    return _loadingView;
}

- (void)endRequestData {
    isGettingData = NO;
    if(!self.hidenLoadingView) {
        self.loadingView.hidden = YES;
    }
    
    [self.activityIndicator stopAnimating];
    [self.tableView reloadData];
    
    if (isHeaderRefresh) {
        [self.tableView.mj_header endRefreshing];
        isHeaderRefresh = NO;
    }
    
    if (isFooterRefresh) {
        [self.tableView.mj_footer endRefreshing];
        isFooterRefresh = NO;
    }
}

- (NSArray*)loadCacheArray
{
    return @[];
}

- (void)headerRereshing {
    isHeaderRefresh = YES;
    isFooterRefresh = NO;
    [self startRequestData];
}

- (void)footerRereshing {
    isHeaderRefresh = NO;
    isFooterRefresh = YES;
    [self startRequestData];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    CGRect frame = self.activityIndicator.frame;
    frame.origin.x = size.width/2 - frame.size.width / 2;
    frame.origin.y = (size.height - frame.size.height) / 2;
    self.activityIndicator.frame = frame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dataArray.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.disableStickyAnimation) {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

@end
