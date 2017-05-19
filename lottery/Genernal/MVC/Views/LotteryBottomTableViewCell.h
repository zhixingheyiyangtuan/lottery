//
//  LotteryBottomTableViewCell.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryBottomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fLabel;
@property (weak, nonatomic) IBOutlet UILabel *sLabel;
@property (weak, nonatomic) IBOutlet UILabel *tLabel;

- (void)setViewWithIndexPath:(NSIndexPath *)indexPath;
@end
