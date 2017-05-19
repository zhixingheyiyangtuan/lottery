//
//  checkNet.h
//  lottery
//
//  Created by 刘勇虎 on 2017/4/18.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface checkNet : NSObject
@property(nonatomic,copy)void(^conecting)(NSURL *url);
+ (checkNet *)shareCheckNet;
- (void)checkCurrentNet;
@end
