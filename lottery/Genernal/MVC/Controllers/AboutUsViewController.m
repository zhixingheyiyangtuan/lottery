//
//  AboutUsViewController.m
//  lottery
//
//  Created by 刘勇虎 on 2017/4/18.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "AboutUsViewController.h"
#import <WebKit/WebKit.h>
@interface AboutUsViewController ()<WKNavigationDelegate>

@end

@implementation AboutUsViewController

-(void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];

//    WKWebView *webview = [[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    webview.navigationDelegate = self;
////    [webview loadRequest:[NSURLRequest requestWithURL:self.sourceUrl]];
//    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
//    [self.view addSubview:webview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"132");
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
