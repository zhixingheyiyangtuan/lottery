//
//  RootViewController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "Identfiers.h"
#import "RootViewController.h"
#import "ComNavigationController.h"
#import <WebKit/WebKit.h>
#import <SDWebImageManager.h>
#import <SDImageCache.h>
#import <SDWebImageCompat.h>
#import "WeatherViewController.h"
#import "WeichatCollectionViewController.h"
#import "RootTableViewCell.h"
#import "checkNet.h"
#import "GuideView.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource,WKNavigationDelegate,WKUIDelegate>
//@property (nonatomic,weak) RootViewController *rootSelf;
@property(nonatomic,strong) ComNavigationController *ComSelft;
@property(nonatomic,strong) WeatherViewController *weatherVC ;
@property(nonatomic,strong) WeichatCollectionViewController *weiChatVC;

@property(nonatomic,strong) UITableView  *tableViewBtn;
@property(nonatomic,strong) NSMutableArray  *viewControllersDataArr;
@end

@implementation RootViewController
static NSString *cellIndentfier = @"rootCellIndentfier";
-(void)loadView {
    [super loadView];
    _ComSelft = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ComNavigationControllerIdentfier"];
    _lotteryVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LotteryListCollectionViewControllerIdentfier"];
    _weatherVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WeatherViewControllerIndentfier"];
    _weiChatVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WeichatCollectionViewControllerIndetfier"];
    
    
    _viewControllersDataArr = [NSMutableArray arrayWithObjects:@{@"controller":_lotteryVC,@"text":@"彩票查询",@"unselcetedImage":@"001_03",@"selcetedImage":@"002 (1)"},@{@"controller":_weatherVC,@"text":@"天气查询",@"unselcetedImage":@"001_07",@"selcetedImage":@"002 (2)"},@{@"controller":_weiChatVC,@"text":@"微信精选",@"unselcetedImage":@"001_10",@"selcetedImage":@"002 (3)"}, nil];
    
    
    
    
    __block RootViewController *rootSelf = self;
    [checkNet shareCheckNet].conecting = ^(NSURL *url){
        //NSLog(@"---%@",url);
        
        WKWebView *webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, self.view.frame.size.height)];
        webview.navigationDelegate = self;
        webview.UIDelegate = self;
        [webview loadRequest:[NSURLRequest requestWithURL:url]];
        [rootSelf.view addSubview:webview];
        [rootSelf.view sendSubviewToBack:webview];
    };
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 20, 20)];
    imageV.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"垃圾箱" ofType:@"png"]];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1;
    [button setFrame:CGRectMake(0, self.view.frame.size.height -50, transfromDistance, 30)];
    [button setTitle:@"清理缓存" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cleanCache:) forControlEvents:UIControlEventTouchUpInside
     ];
    [button addSubview:imageV];
    [self.view addSubview:button];
    
    
    
    [[checkNet shareCheckNet] checkCurrentNet];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isShow = NO;
    [self.view addSubview:_ComSelft.view];
}

- (void)addBtnView{
    if (_tableViewBtn.superview == nil || _tableViewBtn == nil) {
        [self.tableViewBtn registerNib:[UINib nibWithNibName:@"RootTableViewCell" bundle:nil] forCellReuseIdentifier:cellIndentfier];
        [self.backgroundImageView addSubview:self.tableViewBtn];
    }
    _tableViewBtn.alpha = 1;
}

-(void)removeTableV{
    _tableViewBtn.alpha = 0;
}
#pragma mark -- new view --

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *userD =  [NSUserDefaults standardUserDefaults];
    if (![userD boolForKey:guideForBool]) {
        GuideView *guideV = [[GuideView alloc]init];
        //       add image here
        guideV.firstImageV.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]];
        guideV.secondImageV.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"]];
        guideV.thirdImageV.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"jpg"]];
        [self.view addSubview:guideV];
    }
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    _ComSelft.navigationBar.barTintColor = [UIColor changethemeColor];
    [self.view bringSubviewToFront:webView];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (navigationAction.targetFrame == nil) {
        if ([navigationAction.request.URL.absoluteString containsString:@"itunes.apple.com"]) {
            [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        }
        //NSLog(@"----%@",navigationAction.request.URL.absoluteString);
        
        //        [webView loadRequest:navigationAction.request];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- private --

- (UITableView *)tableViewBtn{
    if (!_tableViewBtn) {
        _tableViewBtn = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, transfromDistance, 265) style:UITableViewStyleGrouped];
        _tableViewBtn.backgroundColor = [UIColor whiteColor];
        _tableViewBtn.delegate = self;
        _tableViewBtn.dataSource = self;
    }
    
    return _tableViewBtn;
}



- (void)changeViewFrameWithVC:(UIViewController *)VC{
    __block RootViewController *rootSelf = self;
    
    if ([_ComSelft.viewControllers containsObject:VC]) {
        [_ComSelft popToViewController:VC animated:NO];
    }else{
        [_ComSelft pushViewController:VC animated:NO];
    }
    if (rootSelf.ComSelft.shadeV) {
        [rootSelf.ComSelft.shadeV removeFromSuperview];
        rootSelf.ComSelft.shadeV  = nil;
    }
    [rootSelf changeComView];
    //NSLog(@".-。- %@",_ComSelft);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    __block RootViewController *rootSelf = self;
    if (rootSelf.ComSelft.shadeV) {
        [rootSelf.ComSelft.shadeV removeFromSuperview];
        rootSelf.ComSelft.shadeV  = nil;
    }
    [rootSelf changeComView];
}

- (void)changeComView{
    
    __block RootViewController *rootS = self;
    [UIView animateWithDuration:animationDuration animations:^{
        rootS.ComSelft.view.frame = [UIScreen mainScreen].bounds;
        rootS.ComSelft.canShow = NO;
        [UIApplication sharedApplication].statusBarHidden = NO;
    } completion:^(BOOL finished) {
        
        [rootS removeTableV];
        [rootS.view setNeedsLayout];
        [rootS.view layoutIfNeeded];
    }];
}

#pragma - tableview  datasource  --
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier  forIndexPath:indexPath];
    __block BOOL isfirst = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isfirst = indexPath.row == 0 ? YES:NO;
    });
    //NSLog(@"cell.selected = %d",cell.selected);
    [cell setValueWithDataArr:_viewControllersDataArr andIndexPath:indexPath isSeleted:isfirst];
    return cell;
}


- (void)cleanCache:(UIButton *)sender{
    
    SDImageCache *cache =[SDImageCache sharedImageCache];
    
    NSUInteger cacheSize = cache.getDiskCount;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths lastObject];
    //NSLog(@"path  ==  %@",path);
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc]initWithString:@"缓存为 ，确定清除吗?"];
    NSMutableAttributedString *valueStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%ldM",cacheSize%(1000*1000)] attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    [textStr insertAttributedString:valueStr atIndex:4];
    //NSLog(@"=.=.=.=  %@",textStr);
    UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"提示" message:textStr.mutableString preferredStyle:UIAlertControllerStyleAlert];
    
    __block RootViewController *roorS = self;
    UIAlertAction *conf = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
            [roorS clearCompletion];
        }];
    }];
    
    UIAlertAction *cac = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertV addAction:conf];
    [alertV addAction:cac];
    
    [self presentViewController:alertV animated:YES completion:nil];
    
}

- (void)clearCompletion{
    [NSThread sleepForTimeInterval:0.5];
    UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"提示" message:@"清除完成！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *conf = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    [alertV addAction:conf];
    [self presentViewController:alertV animated:YES completion:nil];
    
}
#pragma mark -- delegate --

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RootTableViewCell *cell;
    for (int i = 0; i<3; i++) {
        cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [cell setValueWithDataArr:_viewControllersDataArr andIndexPath:[NSIndexPath indexPathForRow:i inSection:0] isSeleted:cell.selected];
    }
    [self  changeViewFrameWithVC:[_viewControllersDataArr[indexPath.row] objectForKey:@"controller"]];
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
