//
//  lotteryCollectionViewCell.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LotteryModels.h"
@interface lotteryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *lotteryImageView;
@property (weak, nonatomic) IBOutlet UILabel *lotteryLabel;
@property(nonatomic,strong)LotteryModels *lotteryModels;
-(void)setLotteryModels:(LotteryModels *)lotteryModels withIdexPath:(NSIndexPath *)indexPath;
@end
