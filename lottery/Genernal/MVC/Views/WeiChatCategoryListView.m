//
//  WeiChatCategoryListView.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "WeiChatCategoryListView.h"

@implementation WeiChatCategoryListView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        
        
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    UIBlurEffect  *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *view = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    view.frame = self.bounds;
    [self addSubview:view];
}


@end
