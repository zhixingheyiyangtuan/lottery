//
//  ComNavigationController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "Identfiers.h"
#import "ComNavigationController.h"
#import "LotteryListCollectionViewController.h"
#import "WeichatCollectionViewController.h"
#import "RootViewController.h"


@interface ComNavigationController ()

@end

@implementation ComNavigationController

-(void)loadView {
    [super loadView];
    _canShow = NO;
    
//    NSLog(@"---%@",self);
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setBarTintColor:[UIColor  themeColor]];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20 weight:2]}];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeView{
    self.canShow = !self.canShow;
    __block ComNavigationController *ComVCS = self;
    __block RootViewController *rootV = (RootViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (_canShow) {
        [UIApplication sharedApplication].statusBarHidden = YES;
        ComVCS.shadeV = [[ShadeView alloc]init];
        [ComVCS.view addSubview:ComVCS.shadeV];
        [rootV addBtnView];
        [UIView animateWithDuration:animationDuration animations:^{
            ComVCS.view.frame = CGRectMake(transfromDistance,  ComVCS.view.frame.origin.y, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIApplication sharedApplication].statusBarHidden = NO;
        [rootV removeTableV];
        if (_shadeV) {
            [_shadeV removeFromSuperview];
            _shadeV = nil;
        }
        [UIView animateWithDuration:animationDuration animations:^{
            ComVCS.view.frame = CGRectMake(0, ComVCS.view.frame.origin.y, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
            
        } completion:^(BOOL finished) {
            
        }];
        
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
