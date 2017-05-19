//
//  WehchatListModel.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WehchatListModel : NSObject
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *title;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
