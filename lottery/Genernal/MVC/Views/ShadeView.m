//
//  ShadeView.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "ShadeView.h"
#import "Identfiers.h"
#import "ComNavigationController.h"
@implementation ShadeView
-(instancetype)init{
    if (self == [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5f;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
