//
//  GuideView.m
//  lottery
//
//  Created by 刘勇虎 on 2017/4/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//


#define kWidth   [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height

#import "GuideView.h"
#import "Identfiers.h"

@implementation GuideView
-(instancetype)init{
    if (self == [super init]) {
        self.frame =[UIScreen mainScreen].bounds;
        self.contentSize = CGSizeMake(kWidth *3, kHeight);
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator  = NO;
        NSArray *imageV = @[self.firstImageV,self.secondImageV,self.thirdImageV];
        NSArray *colors = @[ [UIColor redColor], [UIColor yellowColor], [UIColor cyanColor]];
        for (NSInteger i = 0;i < 3 ; i++) {
            UIImageView *view = imageV[i];
            view.frame = CGRectMake(i *kWidth, 0, kWidth, kHeight);
            view.backgroundColor  = colors[i];
            
        }
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeGuide)];
        [self.thirdImageV addGestureRecognizer:tap];
        [self addSubview:self.firstImageV];
        [self addSubview:self.secondImageV];
        [self addSubview:self.thirdImageV];
    }
    
    return self;
}
-(UIImageView *)firstImageV{
    if (!_firstImageV) {
        _firstImageV = [[UIImageView alloc]init];
    }
    return _firstImageV;
}
-(UIImageView *)secondImageV{
    if (!_secondImageV) {
        _secondImageV = [[UIImageView alloc]init];
    }
    return _secondImageV;
}
-(UIImageView *)thirdImageV{
    if (!_thirdImageV) {
        _thirdImageV = [[UIImageView alloc]init];
        _thirdImageV.userInteractionEnabled =YES;
    }
    return _thirdImageV;
}

- (void)removeGuide{
    [self removeFromSuperview];
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setBool:YES forKey:guideForBool];
}

@end
