//
//  WehchatListModel.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/17.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "WehchatListModel.h"

@implementation WehchatListModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
