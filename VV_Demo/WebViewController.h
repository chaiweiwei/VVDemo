//
//  BaseWebViewController.h
//  bcy
//
//  Created by chaiweiwei on 16/1/28.
//  Copyright © 2016年 mirroon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic, strong) NSString *url;

@end
