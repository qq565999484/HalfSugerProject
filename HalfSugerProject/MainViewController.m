//
//  MainViewController.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "MainViewController.h"
#import "MyCell.h"
#import "BannerModel.h"
#import "TopicModel.h"
#import "SDImageCache.h"
#import "FileCell.h"
#import "FileCell2.h"
#import "CustomButton.h"
#import "MJRefresh.h"
#import "DetailsView.h"
#import "DetailInfoTableViewController.h"
#import "UserSetViewController.h"




@interface MainViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    UINavigationController *nav;

    

}


@property(strong,nonatomic)NSMutableArray *bannerArray;
@property(strong,nonatomic)NSMutableArray *topicArray;

@property(strong,nonatomic)NSTimer *timer;

@property(nonatomic,assign)int pageNum;


@property(strong,nonatomic)NSArray *titleArray;
@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    [self.publicCollection reloadData];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor=[UIColor whiteColor];
        // Custom initialization
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
            
            [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
            
            [self.navigationController.navigationBar setTranslucent:NO];
            
        }
        
    }
    return self;
}



- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    [self loadDataSource];
    
    
    [self.publicCollection registerNib:[UINib nibWithNibName:@"FileCell2" bundle:nil] forCellWithReuseIdentifier:@"cell0"];
    
    [self.publicCollection registerNib:[UINib nibWithNibName:@"FileCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    
    //加载头部视图
    self.navigationController.navigationBarHidden=YES;
    
    
    _titleArray=[[NSArray alloc] initWithObjects:@"家居", @"创意",@"办公",@"卫浴",@"护肤",@"美食",@"主题",@"植物",@"厨具",@"杂货",@"运动",@"数码",nil];
    
   
    for (int i=0; i<12; i++) {
        CustomButton *button=[[CustomButton alloc] initWithFrame:CGRectMake(5+105*i, 0, 100, self.isHiddenTitleView.frame.size.height) imageStr:[NSString stringWithFormat:@"category_%d@2x.png",i+1] labelStr:_titleArray[i]];
        button.tag=i+1;
        
        [button addTarget:self action:@selector(clickChangeViewAndGotoCategoryView:) forControlEvents:UIControlEventTouchUpInside];
        
       
        [_isHiddenTitleView addSubview:button];
        
    }
    
    _isHiddenTitleView.contentSize=CGSizeMake(105*12,0);
    _isHiddenTitleView.showsVerticalScrollIndicator = NO;

    _isHiddenTitleView.hidden=YES;
    
    [_publicCollection addFooterWithTarget:self action:@selector(insertRowAtBottom)];
    _publicCollection.footerPullToRefreshText=@"想要数据那你就往上拉";
    _publicCollection.footerRefreshingText=@"航哥为你刷新数据";
    
    //创建那个个人中心界面
    
    [self loadSetView];
    
}


- (void)insertRowAtBottom{
    
    
    if (self.bannerArray.count==0) {
        NSLog(@"不下拉刷新");
        _publicCollection.footerPullToRefreshText=@"";
        _publicCollection.footerRefreshingText=@"";
        [self.publicCollection headerEndRefreshing];
        
    }else
    {
        __unsafe_unretained typeof(self) weakSelf = self;
        
        
        ++weakSelf.pageNum;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [weakSelf.publicCollection footerEndRefreshing];
            [CYHHTTPParserEngine requestBannerByPageNum:weakSelf.pageNum completionBlock:^(NSDictionary *dic) {
                NSArray *bannerArr=dic[@"data"][@"banner"];
                NSArray *topicArr=dic[@"data"][@"topic"];
                
                if (bannerArr.count>0) {
                    for (int i=0; i<bannerArr.count; i++) {
                        NSDictionary *dic=bannerArr[i];
                        BannerModel *bannerObj=[[BannerModel alloc] initWithBanner:dic];
                        [weakSelf.bannerArray addObject:bannerObj];
                        
                    }
                }
                
                if (topicArr.count>0) {
                    for (int i=0; i<topicArr.count; i++) {
                        NSDictionary *dic=topicArr[i];
                        TopicModel *topicObj=[[TopicModel alloc] initWithTopic:dic];
                        [weakSelf.topicArray addObject:topicObj];
                        
                    }
                }
                
                
                [weakSelf.publicCollection reloadData];
                [weakSelf.publicCollection headerEndRefreshing];
                
                
            }];
            
            
        });

    
    
    }
    

}



- (void)loadDataSource
{
    self.pageNum=0;
    _topicArray=[NSMutableArray array];
    _bannerArray=[NSMutableArray array];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    
    
    [CYHHTTPParserEngine requestBannerByPageNum:weakSelf.pageNum completionBlock:^(NSDictionary *dic) {
          [weakSelf.publicCollection footerEndRefreshing];
            NSArray *bannerArr=dic[@"data"][@"banner"];
            NSArray *topicArr=dic[@"data"][@"topic"];
            
            for (int i=0; i<bannerArr.count; i++) {
                NSDictionary *dic=bannerArr[i];
                BannerModel *bannerObj=[[BannerModel alloc] initWithBanner:dic];
                [weakSelf.bannerArray addObject:bannerObj];
                
            }
            
            for (int i=0; i<topicArr.count; i++) {
                NSDictionary *dic=topicArr[i];
                TopicModel *topicObj=[[TopicModel alloc] initWithTopic:dic];
                [weakSelf.topicArray addObject:topicObj];
                
            }
            
            
            NSLog(@"%d",self.topicArray.count);
            
            NSLog(@"%@",self.bannerArray);
            
            
            [weakSelf.publicCollection reloadData];
            [weakSelf.publicCollection footerEndRefreshing];
        
        }];
    

}




#pragma mark -
#pragma mark 瀑布流数据源和代理

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.bannerArray.count==0) {
        return 1;
    }else
    {
        return 2;
    }
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.bannerArray.count==0) {
        return self.topicArray.count;
    }
    
    else{
        
        if (section==0) {
            return 1;
        }else
        {
            return self.topicArray.count;
            
            
        }
        
    }
       
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.bannerArray.count==0) {
       
        FileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        TopicModel *topicObj=self.topicArray[indexPath.row];
        
        [cell.picView setImageWithURL:[NSURL URLWithString:topicObj.pic]];
        cell.layer.borderWidth=2;
        cell.layer.borderColor=[UIColor grayColor].CGColor;
        cell.picName.text=topicObj.topicTitle;
        cell.picDesc.text=topicObj.desc;
        cell.picLinks.text=[NSString stringWithFormat:@"%d",topicObj.likes];
        
        return cell;

    }else
    {
        if (indexPath.section==0) {
            FileCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
            
            
            for (int i=0; i<self.bannerArray.count;i++) {
                BannerModel *bannerObj=self.bannerArray[i];
                UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                button.frame=CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, cell.CellScrollView.frame.size.height);
                
                button.tag=i+1;
                [button setImageWithURL:[NSURL URLWithString:bannerObj.photo]];
                [button addTarget:self action:@selector(buttonClickIntoDetail:) forControlEvents:UIControlEventTouchUpInside];
                [cell.CellScrollView addSubview:button];
            }
            cell.CellScrollView.contentSize=CGSizeMake(768*5,0 );
            
            
            return cell;
            
        }
        else {
            FileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
            
            TopicModel *topicObj=self.topicArray[indexPath.row];
            
            [cell.picView setImageWithURL:[NSURL URLWithString:topicObj.pic]];
            cell.layer.borderWidth=2;
            cell.layer.borderColor=[UIColor grayColor].CGColor;
            cell.picName.text=topicObj.topicTitle;
            cell.picDesc.text=topicObj.desc;
            cell.picLinks.text=[NSString stringWithFormat:@"%d",topicObj.likes];
            
            return cell;
            
        }
    
    }
   

}

-(void)buttonClickIntoDetail:(UIButton *)button
{
    BannerModel *bannerObj=_bannerArray[button.tag-1];
    
    DetailsView *vc=[[DetailsView alloc] init];
    vc.nacTitle=bannerObj.bannerTitle;
    vc.extend=bannerObj.extend;
    [self.navigationController pushViewController:vc animated:YES];

}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_bannerArray.count==0) {
        return CGSizeMake(370, 250);
    }else
    {
        if (indexPath.section==0) {
            return CGSizeMake(self.view.frame.size.width, 200);
        }else
        {
            return CGSizeMake(370, 250);
        }
    
    }
    
    
    

}




- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

    return UIEdgeInsetsMake(5, 5, 5, 5);

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    TopicModel *topicObj=_topicArray[indexPath.row];
    
    DetailInfoTableViewController *dvc=[[DetailInfoTableViewController alloc] init];
    dvc.context=[NSString stringWithFormat:@"%d",topicObj.topicID];
    
    
    [self.navigationController pushViewController:dvc animated:YES];
}


#pragma mark -
#pragma mark button的点击方法
- (IBAction)displayHiddenView:(id)sender {
    
    
    UIButton *button=(UIButton *)sender;
  
    
    button.selected=!button.selected;
    
    if (button.selected) {
        _isHiddenTitleView.hidden=NO;
        _changeImageView.image=[UIImage imageNamed:@"arrow_up"];
        button.selected=YES;
    }else
    {
        
        //重新获取数据源
        //这块的页面应该是一个push?模块弹出?还是将当前collectionView
        //中的数据全部清除  然后嘿嘿嘿..改成分类信息
        _isHiddenTitleView.hidden=YES;
        
        _changeImageView.image=[UIImage imageNamed:@"arrow_down"];
        button.selected=NO;
        ////跳转到某个分类页面
    
    }
    
    
}

- (IBAction)goHome:(id)sender {
    
    [self loadDataSource];
    _categoryButton.text=@"分类";
   
    
}
- (IBAction)goSet:(id)sender {
    
    [UIView animateWithDuration:2 animations:^{
       
        nav.view.bounds=CGRectMake(0, 0, 400, 600);
        
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled=NO;
    }];
}

- (void)loadSetView
{

        UserSetViewController *userSettingVC = [[UserSetViewController alloc] init];
        
        nav = [[UINavigationController alloc] initWithRootViewController:userSettingVC];
        nav.view.center=self.view.center;
        nav.view.bounds=CGRectMake(0, 0, 0, 0);
    
        nav.navigationBarHidden = YES;
   
        [self.view addSubview:nav.view];

}


- (IBAction)goLogin:(id)sender {
    
    
    
}

-(void)clickChangeViewAndGotoCategoryView:(CustomButton *)button
{
    
    [self.publicCollection removeHeader];
    
    
    NSString *title=_titleArray[button.tag-1];
    _isHiddenTitleView.hidden=YES;
    _categoryButton.text=title;
    _changeImageView.image=[UIImage imageNamed:@"arrow_down"];
    //重装数据源
    
    __weak MainViewController *weakSelf=self;
    
    [CYHHTTPParserEngine requestBannerByCategoryID:button.tag completionBlock:
     ^(NSDictionary *dic) {
         [weakSelf.bannerArray removeAllObjects];
         [weakSelf.topicArray removeAllObjects];
         
         NSArray *topicArr=dic[@"data"][@"topic"];
         
         
         for (int i=0; i<topicArr.count; i++) {
             NSDictionary *dic=topicArr[i];
             TopicModel *topicObj=[[TopicModel alloc] initWithTopic:dic];
             [weakSelf.topicArray addObject:topicObj];
             
         }
         
         NSLog(@"%d",self.topicArray.count);
         
         NSLog(@"%@",self.bannerArray);
         
         
         [weakSelf.publicCollection reloadData];
 
     }
     
     ];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.view.userInteractionEnabled=YES;
    [UIView animateWithDuration:2 animations:^{
        nav.view.center=self.view.center;
        nav.view.bounds=CGRectMake(0, 0, 0, 0);
        
        nav.view.frame=CGRectMake(self.view.center.x, self.view.center.y, 0, 0);
        
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled=YES;
    }];


}




@end
