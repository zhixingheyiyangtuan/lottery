//
//  LotteryDetailViewController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/11.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "Identfiers.h"
#import "LotteryTopData.h"
#import "LotteryModels.h"
#import "LotteryDetailViewController.h"
#import "LotteryDetailTopTableViewCell.h"
#import "LotteryBottomTableViewCell.h"
#import "LoadingView.h"


@interface LotteryDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet LotteryDetalTableVIew *lotteryDetailTableView;
@property(nonatomic,strong)UILabel  *headerView;

@end

@implementation LotteryDetailViewController

static NSString *topIndentfier = LotteryDTTCellIdentfier;
static NSString *botIndentfier = LotteryDTBCellIdentfier;
-(void)loadView{
    [super loadView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"004_03" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backToFormaterPage:)];
    
    
    // Do any additional setup after loading the view.
    
    [self.lotteryDetailTableView registerNib:[UINib nibWithNibName:@"LotteryDetailTopTableViewCell" bundle:nil] forCellReuseIdentifier:topIndentfier];
    
    [self.lotteryDetailTableView registerNib:[UINib nibWithNibName:@"LotteryBottomTableViewCell" bundle:nil] forCellReuseIdentifier:botIndentfier];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[LoadingView shareLoadingView]];
    
    [[LoadingView shareLoadingView] startLoadingAnimation];
    __block LotteryDetailViewController *selfVC = self;
    [LotteryTopData  shareLotteryTopData].complection = ^(){
        //reload
        
        [selfVC.lotteryDetailTableView reloadData];
        
        if ([selfVC.view.subviews containsObject:[LoadingView shareLoadingView]]) {
            [[LoadingView shareLoadingView] stopLoadingAnimation];
        }
    };
//    NSLog(@"=/=/==    %@",self.title);
    [[LotteryTopData  shareLotteryTopData] getDataWithName:self.title andPeriod: nil];
}


- (void)backToFormaterPage:(UIBarButtonItem *)sender{
    if ([self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [[LoadingView shareLoadingView] stopLoadingAnimation];
    }
    
    [self.navigationController popViewControllerAnimated:YES
     ];
}


#pragma mark -- data source --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    } else {
        
        if (section >1) {
//            NSLog(@"123  --%ld",[LotteryTopData shareLotteryTopData].lotteryModel.lotteryDetails.count);
            return [LotteryTopData shareLotteryTopData].lotteryModel.lotteryDetails.count;
        }
        return 1;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        LotteryDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:topIndentfier forIndexPath:indexPath];
        [cell setViewWithIndexPath:indexPath];
        return cell;
    } else {
        LotteryBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:botIndentfier forIndexPath:indexPath];
        
        if (indexPath.section >1) {
            if (indexPath.row % 2 == 0) {
                cell.fLabel.backgroundColor =  [UIColor colorWithRed:209/225.0 green:210/225.0 blue:211/225.0 alpha:1.0f];
                cell.sLabel.backgroundColor =  [UIColor colorWithRed:209/225.0 green:210/225.0 blue:211/225.0 alpha:1.0f];
                cell.tLabel.backgroundColor =  [UIColor colorWithRed:209/225.0 green:210/225.0 blue:211/225.0 alpha:1.0f];
                
                
            }else{
                //                cell.layer.borderColor = [UIColor blackColor].CGColor;
                //                cell.layer.borderWidth = 1.0f;
                cell.fLabel.backgroundColor =  [UIColor whiteColor];
                cell.sLabel.backgroundColor =  [UIColor whiteColor];
                cell.tLabel.backgroundColor =  [UIColor whiteColor];
            }
            
            [cell setViewWithIndexPath:indexPath];
        }
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *lab ;
    if (section == 0) {
        _headerView = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-10, 40)];
        lab =   [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        [lab addSubview:_headerView];
        _headerView.font = [UIFont systemFontOfSize:20];
    }
    if ([LotteryTopData shareLotteryTopData].lotteryModel.period) {
        _headerView.text = [NSString stringWithFormat:@"第%@期",[LotteryTopData shareLotteryTopData].lotteryModel.period];
    }else{
        _headerView.text = @"暂无数据";
    }
    
    return lab ?lab:nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0? 40:30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0? 40:15;
}


#pragma mark -- view  pravite method --

- (IBAction)formateData:(id)sender {
    if (![self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [self.view addSubview:[LoadingView shareLoadingView]];
        [[LoadingView shareLoadingView] startLoadingAnimation];
    }
    NSString *tempPeriod = [NSString stringWithFormat:@"%d",[[LotteryTopData shareLotteryTopData].lotteryModel.period intValue]-1];
    [[LotteryTopData  shareLotteryTopData] getDataWithName:self.title andPeriod:tempPeriod ];
    
}
- (IBAction)nextData:(id)sender {
    if (![self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [self.view addSubview:[LoadingView shareLoadingView]];
        [[LoadingView shareLoadingView] startLoadingAnimation];
    }
    
    
    NSString *tempPeriod = [NSString stringWithFormat:@"%d",[[LotteryTopData shareLotteryTopData].lotteryModel.period intValue] +1];
    [[LotteryTopData  shareLotteryTopData] getDataWithName:self.title andPeriod:tempPeriod ];
}

#pragma mark -- pragam manager --
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
