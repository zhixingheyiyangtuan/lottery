//
//  WeichatListCollectionViewCell.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "WehchatListModel.h"

@interface WeichatListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *thumbTitleLabel;
@property(nonatomic,strong) WehchatListModel *model;
@property(nonatomic,strong)NSString *sourceUrl ;
@end
