//
//  LotteryTopData.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LotteryTopData.h"
#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "Identfiers.h"
#import "LotteryModels.h"
#import "LoadingView.h"
@interface LotteryTopData ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end
@implementation LotteryTopData
-(instancetype)init{
    if (self == [super init]) {
        
        self.dataArr = [NSMutableArray arrayWithObjects:@{@"imageName":@"lotteryNumber",@"titleName":@"开奖号码:",@"backColor":[UIColor whiteColor]},
                        @{@"imageName":@"lotteryPeriod",@"titleName":@"开奖日期:",@"backColor":lotteryDetailCellBackGColor},
                        @{@"imageName":@"currentSales",@"titleName":@"本期销量:",@"backColor":[UIColor whiteColor]},
                        @{@"imageName":@"currentBonus",@"titleName":@"奖池奖金:",@"backColor":lotteryDetailCellBackGColor}, nil];
        _lotteryDetailArr = [NSMutableArray arrayWithCapacity:0];
        _lotteryModel = [[LotteryModels alloc]init];
    }
    return self;
}
+(LotteryTopData *)shareLotteryTopData{
    static  LotteryTopData *loTD;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loTD = [[LotteryTopData alloc]init];
    });
    return loTD;
}
-(NSDictionary *)getCurrentModelsWithIndexPah:(NSIndexPath *)indexPath{
    LotteryTopData *data = [LotteryTopData shareLotteryTopData];
    
    NSDictionary *dic = [data.dataArr objectAtIndex:indexPath.row];
    
    return dic;
}

- (void)getDataWithName:(NSString *) name andPeriod:(NSString *)period{
    
    
    AFHTTPSessionManager *afnManager = [AFHTTPSessionManager manager];
    afnManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    afnManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *getDataUrlStr = [NSString stringWithFormat:@"%@%@",lotteryRequestHeader,name];
//    NSLog(@"--  --%@",getDataUrlStr);
    
    getDataUrlStr = [getDataUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSDictionary *parameter= nil;
    if (period != nil) {
        parameter= @{@"period":period};
    }
    __block LotteryTopData *dataSelf = self;
    [afnManager GET:getDataUrlStr parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        //    [afnManager GET:@"http://apicloud.mob.com/lottery/query?name=%E5%8F%8C%E8%89%B2%E7%90%83&period=&key=1cfe8e5baeca0" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //        NSLog(@"-.--..-    %@",dic);
        if ([[dic objectForKey:@"msg"] isEqualToString:@"success"]) {
            
            [dataSelf.lotteryModel setValuesForKeysWithDictionary:[dic objectForKey:@"result"]];
//            NSLog(@"-- !!! -- %@",dataSelf.lotteryModel.lotteryDetails);
            
//            NSLog(@"---%@",dataSelf);
            dataSelf.complection();
            
        } else if ([[dic objectForKey:@"msg"] isEqualToString:@"暂无此期开彩数据"]) {
            if ([LoadingView shareLoadingView].superview != nil) {
                [[LoadingView shareLoadingView] stopLoadingAnimation];
            }
            UIAlertController *aletVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"已是最新开奖数据!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confrimA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [aletVC addAction:confrimA];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:aletVC animated:YES completion:nil];
        }else{
            if ([LoadingView shareLoadingView].superview != nil) {
                [[LoadingView shareLoadingView] stopLoadingAnimation];
            }
            UIAlertController *aletVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络错误，请检查您的网络!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confrimA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [aletVC addAction:confrimA];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:aletVC animated:YES completion:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([LoadingView shareLoadingView].superview != nil) {
            [[LoadingView shareLoadingView] stopLoadingAnimation];
        }
        UIAlertController *aletVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络错误，请检查您的网络!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confrimA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [aletVC addAction:confrimA];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:aletVC animated:YES completion:nil];
    }];
}
@end
