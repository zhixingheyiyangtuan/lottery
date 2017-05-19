//
//  LotteryDetailTopTableViewCell.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LotteryDetailTopTableViewCell.h"
#import "LotteryTopData.h"
#import "LotteryModels.h"
@implementation LotteryDetailTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setViewWithIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *dataDic  = [[LotteryTopData shareLotteryTopData] getCurrentModelsWithIndexPah:indexPath];

    self.iconImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[dataDic objectForKey:@"imageName"] ofType:@"png"]];
    self.detialTileLabel.text = [dataDic objectForKey:@"titleName"];
    self.contentView.backgroundColor = [dataDic objectForKey:@"backColor"];

    switch (indexPath.row) {
        case 0:
            if ([LotteryTopData shareLotteryTopData].lotteryModel.lotteryNumber) {
                self.detialVlaueLabel.text = [[LotteryTopData shareLotteryTopData].lotteryModel.lotteryNumber componentsJoinedByString:@","];
            }
            break;
        case 1:
            if ([LotteryTopData shareLotteryTopData].lotteryModel.awardDateTime) {
                self.detialVlaueLabel.text = [LotteryTopData shareLotteryTopData].lotteryModel.awardDateTime;
            }
            break;
        case 2:
            if ([LotteryTopData shareLotteryTopData].lotteryModel.sales) {
              
                self.detialVlaueLabel.text = [NSString stringWithFormat:@"%ld", [LotteryTopData shareLotteryTopData].lotteryModel.sales ];
            }
            break;
        default:
            if ([LotteryTopData shareLotteryTopData].lotteryModel.pool) {
                self.detialVlaueLabel.text = [NSString stringWithFormat:@"%.2f", [LotteryTopData shareLotteryTopData].lotteryModel.pool ];
            }
            break;
    }
    

}

@end
