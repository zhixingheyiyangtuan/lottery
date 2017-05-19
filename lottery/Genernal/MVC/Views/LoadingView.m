//
//  LoadingView.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LoadingView.h"
#import "Identfiers.h"
@interface LoadingView ()
@property(nonatomic,strong)UIImageView *animationView;
@end

@implementation LoadingView

+(LoadingView *)shareLoadingView{
    static LoadingView *view ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[LoadingView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        view.backgroundColor = colorForLoadingBack;
        view.animationView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-75, [UIScreen mainScreen].bounds.size.height/2 -150, 150, 150)];
        NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 25; i++) {
            [imageArr addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"png"]]];
        }
        [view addSubview:view.animationView];
        view.animationView.animationImages = imageArr;
    });
    return view;
}

-(void)startLoadingAnimation{
    [_animationView startAnimating];
}
-(void)stopLoadingAnimation{
    [_animationView stopAnimating];
    [self removeFromSuperview];
}
@end
