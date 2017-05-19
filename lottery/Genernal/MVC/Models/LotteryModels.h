//
//  LotteryModels.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryModels : NSObject
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSString *awardDateTime;
@property(nonatomic,strong)NSMutableArray *lotteryDetails;//开奖个数
@property(nonatomic,strong)NSMutableArray *lotteryNumber;//开奖号码
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *period;
@property(nonatomic,assign)CGFloat pool;
@property(nonatomic,assign)NSInteger sales;
@end
