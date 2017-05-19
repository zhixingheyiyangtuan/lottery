//
//  LotteryModels.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LotteryModels.h"

@implementation LotteryModels
-(instancetype)init{
    if (self == [super init]) {
        if (!_dataArr) {
             _dataArr = [NSMutableArray arrayWithArray:@[@{@"text":@"双色球",@"image":@"shuangseqiu"},@{@"text":@"大乐透",@"image":@"daletou"},@{@"text":@"排列3",@"image":@"pailiesan"},@{@"text":@"排列5",@"image":@"paliewu"},@{@"text":@"七乐彩",@"image":@"7lecai"},@{@"text":@"七星彩",@"image":@"7cai"}]];
        }
    }
    return self;
}

//-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
//
//}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    NSLog(@"undefind key ==%@",key);
    
}
@end
