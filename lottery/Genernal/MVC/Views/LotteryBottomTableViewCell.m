//
//  LotteryBottomTableViewCell.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LotteryBottomTableViewCell.h"
#import "LotteryTopData.h"
#import "LotteryModels.h"
@implementation LotteryBottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.fLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.sLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    self.fLabel.layer.borderWidth = 0.50f;
    self.sLabel.layer.borderWidth = 0.50f;
    self.tLabel.layer.borderWidth = 0.50f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)setViewWithIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"----   ---- %ld",indexPath.row);
    if ([LotteryTopData shareLotteryTopData].lotteryModel.lotteryDetails !=nil){
        if ( [LotteryTopData shareLotteryTopData].lotteryModel.lotteryDetails.count >0) {
           NSDictionary *dic = [LotteryTopData shareLotteryTopData].lotteryModel.lotteryDetails[indexPath.row];
            self.fLabel.text = [dic valueForKey:@"awards"];
            self.sLabel.text = [NSString stringWithFormat:@"%d",[dic valueForKey:@"awardNumber"]];
            self.tLabel.text = [NSString stringWithFormat:@"%d",[dic valueForKey:@"awardPrice"]];
//            NSLog(@".=.=  %@",  dic);
            dic = nil;
            
        }
     
        
    }
}
@end
