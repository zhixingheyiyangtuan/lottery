//
//  LotteryListCollectionViewController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LotteryListCollectionViewController.h"
#import "RootViewController.h"
#import "ComNavigationController.h"
#import "Identfiers.h"
#import "lotteryCollectionViewCell.h"
#import "LotteryModels.h"
#import "LotteryDetailViewController.h"

@interface LotteryListCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    LotteryModels *lotteryData;
}
@property(nonatomic,strong)ComNavigationController *comVC;

@end

@implementation LotteryListCollectionViewController

static NSString * const reuseIdentifier = @"lotteryCellIndentfer";

-(void)loadView {
    [super loadView];
    self.navigationItem.title = @"彩票查询";
    
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"彩票类_04"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(showMenuList)];
    
    lotteryData = [[LotteryModels alloc]init];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    NSLog(@"--%@",[UIApplication sharedApplication].keyWindow.rootViewController);
   
};

- (void)viewDidLoad {
    [super viewDidLoad];
    _comVC = (ComNavigationController *)self.navigationController;
    // Do any additional setup after loading the view.
}

- (void)showMenuList {
    [_comVC changeView];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (_comVC.view.frame.origin.x !=0) {
        [_comVC changeView];
    }
    
}
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    lotteryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setLotteryModels:lotteryData withIdexPath:indexPath];
    // Configure the cell
        return cell;
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    lotteryCollectionViewCell *cell = (lotteryCollectionViewCell*)[collectionView  cellForItemAtIndexPath:indexPath];
    LotteryDetailViewController *vC = (LotteryDetailViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"lotteryDetailViewControllerIndentfier"];
    vC.title = cell.lotteryLabel.text;
//    NSLog(@"cell.lotteryLabel.text - %@",cell.lotteryLabel.text);
    [self.navigationController pushViewController:vC animated:YES];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float width=self.view.bounds.size.width/2-20;
    return CGSizeMake(width, width+20);
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
