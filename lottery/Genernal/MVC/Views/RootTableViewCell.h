//
//  RootTableViewCell.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)setValueWithDataArr:(NSMutableArray *)dataArr andIndexPath:(NSIndexPath*)indexPath isSeleted:(BOOL)isSelected;
@end
