//
//  RootTableViewCell.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setValueWithDataArr:(NSMutableArray *)dataArr andIndexPath:(NSIndexPath*)indexPath isSeleted:(BOOL)isSelected{
    if (!isSelected) {
        self.thumbnailImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[dataArr[indexPath.row] objectForKey:@"unselcetedImage"] ofType:@"png"]];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.titleLabel.text =[dataArr[indexPath.row] objectForKey:@"text"];
        self.titleLabel.textColor = [UIColor blackColor];
    }else{
        self.thumbnailImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[dataArr[indexPath.row] objectForKey:@"selcetedImage"] ofType:@"png"]];
        self.contentView.backgroundColor = [UIColor redColor];
        self.titleLabel.text =[dataArr[indexPath.row] objectForKey:@"text"];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    
}

@end
