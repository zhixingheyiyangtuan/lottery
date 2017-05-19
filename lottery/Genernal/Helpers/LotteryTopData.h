//
//  LotteryTopData.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LotteryTopModels;
@class LotteryModels;
@interface LotteryTopData : NSObject
@property(nonatomic,strong)LotteryModels *lotteryModel;
@property(nonatomic,strong)NSMutableArray *lotteryDetailArr;
@property(nonatomic,copy)void(^complection)();
+(LotteryTopData *)shareLotteryTopData;
-(NSDictionary *)getCurrentModelsWithIndexPah:(NSIndexPath *)indexPath;
- (void)getDataWithName:(NSString *) name andPeriod:(NSString *)period;
@end
