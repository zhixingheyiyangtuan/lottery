//
//  RootViewController.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LotteryListCollectionViewController.h"

@interface RootViewController : UIViewController
@property (strong, nonatomic) UIView *ContatinerVIew;
@property(nonatomic,assign)BOOL isShow;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property(nonatomic,strong) LotteryListCollectionViewController *lotteryVC;

- (void)addBtnView;
-(void)removeTableV;
@end
