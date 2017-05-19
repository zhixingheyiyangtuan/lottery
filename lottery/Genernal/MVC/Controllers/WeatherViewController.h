//
//  WeatherViewController.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlphaBlock)(CGFloat alpha);

@interface WeatherViewController : UIViewController

@property (nonatomic, copy) AlphaBlock alphaBlock;

@end
