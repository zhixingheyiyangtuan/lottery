//
//  WeichatCollectionViewController.m
//  lottery
//
//  Created by 刘勇虎 on 17/4/10.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "Identfiers.h"
#import "WeichatCollectionViewController.h"
#import "ComNavigationController.h"
#import "WeichatListCollectionViewCell.h"
#import "WehchatListModel.h"
#import "LoadingView.h"
#import <AFNetworking.h>
#import "WeiChatDetailViewController.h"
@interface WeichatCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)ComNavigationController *comVC;
@property(nonatomic,strong)NSMutableArray *sourceData;
@end

@implementation WeichatCollectionViewController

static NSString * const reuseIdentifier = @"WeichatListCollectionViewCellIndentfier";
-(void)loadView {
    [super loadView];
    self.navigationItem.title = @"微信精选";
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"彩票类_04"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(showMenuList)];
    //data
    _sourceData = [NSMutableArray arrayWithCapacity:20];
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_sourceData removeAllObjects];
    if (![self.view.subviews containsObject:[LoadingView shareLoadingView]]) {
        [self.view addSubview:[LoadingView shareLoadingView]];
        [[LoadingView shareLoadingView] startLoadingAnimation];
    }
     [self getPageDataWithPage:1 word:@"金融" num:20];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _comVC = (ComNavigationController *)self.navigationController;
    // Uncomment the following line to preserve selection between presentations
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_comVC.view.frame.origin.x !=0) {
        [_comVC changeView];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showMenuList {
    [_comVC changeView];
}
 #pragma mark - Navigation



#pragma mark --cu method --
- (void)getPageDataWithPage:(NSInteger )page word:(NSString *)word num:(NSInteger)num{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    key=APIKEY&num=10&page=1&word=@"财经"
   manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSDictionary *parameters = @{@"page":[NSString stringWithFormat:@"%ld",page],@"word":word,@"key":@"ccec691455525502cec194483030a12d",@"num":[NSString stringWithFormat:@"%ld",num]};
    
    __block WeichatCollectionViewController *selfVC = self;
    [manager GET:weichatListHeader parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//              //NSLog(@"=.=.=.=.=  %@",dic);
        if ([[dic objectForKey:@"msg"] isEqualToString:@"success"]) {
            NSArray *dicArr = [dic objectForKey:@"newslist"];
            for (int i = 0; i <dicArr.count; i ++) {
                NSDictionary *dic = [dicArr objectAtIndex:i];
                WehchatListModel *model = [[WehchatListModel alloc]initWithDic:dic];
                [selfVC.sourceData addObject:model];
            }
            
            [selfVC.collectionView reloadData];
            [[LoadingView shareLoadingView] stopLoadingAnimation
            ];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"=.=.=.=.=  %@",error.userInfo);
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    //NSLog(@"=====   %ld",_sourceData.count);
    return _sourceData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WeichatListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (_sourceData.count >0) {
         cell.model = (WehchatListModel *)_sourceData[indexPath.row];
         //NSLog(@"cell.model == %@",cell.model);
    }
   
   
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WeichatListCollectionViewCell *cell = (WeichatListCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    WeiChatDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"weichatDVC"];
    vc.sourceUrl = cell.sourceUrl;
    
    //NSLog(@"----%@", cell.sourceUrl);
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -- <UICollectionViewDelegateFlowLayout>  --
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float width=self.view.bounds.size.width/2-20;
    return CGSizeMake(width, width+20);
}


@end
