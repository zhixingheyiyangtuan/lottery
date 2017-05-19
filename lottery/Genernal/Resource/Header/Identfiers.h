//
//  Identfiers.h
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#ifndef Identfiers_h
#define Identfiers_h

#define animationDuration             0.2f
#define viewFromTop                   self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height
#define transfromDistance             170
#define guideForBool                  @"guideKey"

//color
#define themeColor                    colorWithRed:206/225.0 green:9/225.0 blue:26/225.0 alpha:1.0f
#define changethemeColor              colorWithRed:98/225.0 green:0/225.0 blue:19/225.0 alpha:1.0f


#define lotteryDetailCellBackGColor   [UIColor colorWithRed:214/225.0 green:215/225.0 blue:216/225.0 alpha:1.0]

#define colorForLoadingBack           [UIColor colorWithRed:248/225.0 green:248/225.0 blue:248/225.0 alpha:1.0]

//tableview  cell indentfiers
#define LotteryDTTCellIdentfier       @"LotteryDetailTopTableViewCellIdentfier"

#define LotteryDTBCellIdentfier       @"LotteryBottomTableViewCellIndentfier"
#endif /* Identfiers_h */


//net headers

#define lotteryRequestHeader          @"http://apicloud.mob.com/lottery/query?key=1cfe8e5baeca0&name="

#define weichatListHeader             @"https://api.tianapi.com/wxnew/?"

#define CHECKNET                      @"http://appmgr.jwoquxoc.com/frontApi/getAboutUs?appid=jiuwcom240"
