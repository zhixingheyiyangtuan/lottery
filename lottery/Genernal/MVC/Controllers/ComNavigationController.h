//
//  ComNavigationController.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShadeView.h"
@interface ComNavigationController : UINavigationController
@property(nonatomic,strong)ShadeView *shadeV;
@property(nonatomic,assign) BOOL canShow;

- (void)changeView;
@end
