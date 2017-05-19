//
//  WeichatListCollectionViewCell.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "WeichatListCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation WeichatListCollectionViewCell
-(void)awakeFromNib{
    [super awakeFromNib];

    UIBlurEffect *beff = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *view = [[UIVisualEffectView   alloc]initWithEffect:beff];
    view.frame = self.thumbTitleLabel.bounds;
    [self.thumbTitleLabel addSubview:view];
    
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5f;
  
}

-(void)setModel:(WehchatListModel *)model{
    [self.thumbImageView  sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
//    //NSLog(@"...model.picUrl  == %@",model.picUrl);
    self.thumbTitleLabel.text = model.title;
    self.model.url = model.url;
    self.sourceUrl = model.url;
//    //NSLog(@"url   ==%@", self.model);
    
}



@end
