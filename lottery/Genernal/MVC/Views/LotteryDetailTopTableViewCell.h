//
//  LotteryDetailTopTableViewCell.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryDetailTopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *detialTileLabel;
@property (weak, nonatomic) IBOutlet UILabel *detialVlaueLabel;


- (void)setViewWithIndexPath:(NSIndexPath *)indexPath;
@end
