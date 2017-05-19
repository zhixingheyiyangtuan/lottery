//
//  WeiChatDetailViewController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "WeiChatDetailViewController.h"
#import <WebKit/WebKit.h>
#import "LoadingView.h"
@interface WeiChatDetailViewController ()<WKNavigationDelegate>

@end

@implementation WeiChatDetailViewController
-(void)loadView {
    [super loadView];
    
 
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"004_03" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backToFormaterPage:)];
    
  
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -64)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.sourceUrl]]];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
    if (![self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [self.view addSubview:[LoadingView shareLoadingView]];
        [[LoadingView shareLoadingView] startLoadingAnimation];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"微信精选";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark --method cu --

- (void)backToFormaterPage:(UIBarButtonItem *)sender{
    if ([self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [[LoadingView shareLoadingView] stopLoadingAnimation];
    }
    [self.navigationController popViewControllerAnimated:YES
     ];
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    if ([[LoadingView shareLoadingView] superview] ==nil) {
        [self.view addSubview:[LoadingView shareLoadingView]];
        [[LoadingView shareLoadingView] startLoadingAnimation];
    }
  
}

#pragma mark --delegate web--

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    if ([self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [[LoadingView shareLoadingView] stopLoadingAnimation];
    }
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
