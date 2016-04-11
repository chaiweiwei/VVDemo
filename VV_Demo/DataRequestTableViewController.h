//
//  DataRequestTableViewController.h
//  Spoon
//
//  Created by 曦炽 朱 on 14-9-22.
//  Copyright (c) 2014年 mirroon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

@interface DataRequestTableViewController : UITableViewController  <UIGestureRecognizerDelegate>{
    BOOL isHeaderRefresh;
    BOOL isFooterRefresh;
    BOOL isGettingData; // 正在获取数据中
}

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic) BOOL disableHeaderRefresh;
@property (nonatomic) BOOL disableFooterRefresh;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) LoadingView * loadingView;
@property (nonatomic,assign) BOOL disableStickyAnimation;
@property (nonatomic,assign) BOOL hidenLoadingView;

- (NSArray*)loadCacheArray;
- (void)startRequestData;
- (void)endRequestData;

- (void)headerRereshing;
- (void)footerRereshing;

@end
