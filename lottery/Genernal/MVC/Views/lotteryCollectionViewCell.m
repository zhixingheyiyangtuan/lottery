//
//  lotteryCollectionViewCell.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "lotteryCollectionViewCell.h"

@implementation lotteryCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)setLotteryModels:(LotteryModels *)lotteryModels withIdexPath:(NSIndexPath *)indexPath{
   
    self.lotteryImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[lotteryModels.dataArr[indexPath.row] objectForKey:@"image"] ofType:@"png"]];
    self.lotteryLabel.text = [lotteryModels.dataArr[indexPath.row] objectForKey:@"text"];
    
}
@end
