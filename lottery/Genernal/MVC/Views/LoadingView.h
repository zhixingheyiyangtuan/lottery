//
//  LoadingView.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView: UIView

-(void)startLoadingAnimation;
-(void)stopLoadingAnimation;

+(LoadingView *)shareLoadingView;
@end
