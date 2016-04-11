//
//  BaseWebViewController.m
//  bcy
//
//  Created by chaiweiwei on 16/1/28.
//  Copyright © 2016年 mirroon. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()<UIScrollViewDelegate>{
    NSMutableString *weiboContent;
    NSMutableString *otherContent;
    UIImage *shareImage;
}

@property (nonatomic,strong) UIWebView *webView;
@property(nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToHome)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.webView];
    
    [self.view addSubview:self.activityIndicatorView];
    
    if (self.url) {
        NSURL *u = [NSURL URLWithString:self.url];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:u];
        
        [self.webView loadRequest:request];
    }else {
        NSURL *u = [NSURL URLWithString:@"http://www.baidu.com"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:u];
        
        [self.webView loadRequest:request];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if(!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.hidesWhenStopped = YES;
        _activityIndicatorView.center = self.view.center;
    }
    return _activityIndicatorView;
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        
        _webView.scrollView.delegate = self;
    }
    
    return _webView;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.navigationController.navigationBar.topItem.title = title;

    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"error_message");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityIndicatorView stopAnimating];
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    [self updateBackButton];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_activityIndicatorView startAnimating];
    
    [self updateBackButton];
}

- (void)updateBackButton {
    if(self.webView.canGoBack) {
        
        UIButton *backButton = [[UIButton alloc] init];
        backButton.frame = CGRectMake(0, 0, 20, 20);
        [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backWasClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        UIButton *closeButton = [[UIButton alloc] init];
        closeButton.frame = CGRectMake(0, 0, 20, 20);
        [closeButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(backToHome) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
        [self.navigationItem setLeftBarButtonItems:@[backItem,closeItem] animated:NO];
    }else {
        self.navigationItem.leftBarButtonItems = nil;
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backToHome)];
    }
}

- (void)backToHome {
    if (self.navigationController.viewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backWasClicked:(id)sender {
    if([self.webView canGoBack]) {
        [self.webView goBack];
    }else {
        [self backToHome];
    }
}


@end
