//
//  MainViewController.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "MainViewController.h"
#import "HeaderView.h"
#import "BannerModel.h"
#import "TopicModel.h"
#import "SDImageCache.h"
#import "MyCell.h"



@interface MainViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property(strong,nonatomic)NSMutableArray *dataArray;

@property(strong,nonatomic)HeaderView *headerView;
@property(strong,nonatomic)NSTimer *timer;
@property(strong,nonatomic)UIScrollView *scrollView;
@property(strong,nonatomic)UIPageControl *pageControl;
@property(strong,nonatomic)UICollectionView *collectionView;

@end

@implementation MainViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
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
    
    [self loadHeadView];
    //先设置头
    [self.navigationController.navigationBar addSubview:_headerView];
    
    _dataArray=[[NSMutableArray alloc] initWithCapacity:0];
    [CYHHTTPParserEngine requestBannerWithcompletionBlock:^(NSDictionary *dic) {
        NSArray *bannerArr=dic[@"data"][@"banner"];
        NSArray *topicArr=dic[@"data"][@"topic"];
        
        for (int i=0; i<bannerArr.count; i++) {
            NSDictionary *dic=bannerArr[i];
            BannerModel *bannerObj=[[BannerModel alloc] initWithBanner:dic];
            [_dataArray addObject:bannerObj];
            
        }
        
        for (int i=0; i<topicArr.count; i++) {
            NSDictionary *dic=topicArr[i];
            TopicModel *topicObj=[[TopicModel alloc] initWithTopic:dic];
            [_dataArray addObject:topicObj];
            
        }
        NSLog(@"%@",_dataArray);
        
    }];
    
    [self addTimer];
    
    
    //设置collection的属性,代理和注册表格
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(380, 250);
    layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    layout.minimumLineSpacing = 2;
    
    
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
    

   
}

- (void)loadHeadView
{
    _headerView=[[HeaderView alloc] init];
    _headerView.frame=CGRectMake(0, 0, self.view.frame.size.width, 64);
    
}



-(UIScrollView *)scrollView
{
    
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc] init];
        _scrollView.layer.borderWidth=5;
        _scrollView.layer.borderColor=[UIColor whiteColor].CGColor;
        
        _scrollView.frame=CGRectMake(0, 64, self.view.frame.size.width, 150);
        _scrollView.backgroundColor=[UIColor greenColor];
        for (int i=0; i<5; i++) {
            BannerModel *bannerObj=_dataArray[i];
            
            UIImageView *imgView=[[UIImageView alloc] init];
            
            //图片X
            CGFloat imageX=i*self.view.frame.size.width;
            
            //给图片设置坐标大小参数
            imgView.frame=CGRectMake(imageX, 0, self.view.frame.size.width,_scrollView.frame.size.height);
            
            //设置图片
           
            [imgView setImageWithURL:[NSURL URLWithString:bannerObj.photo]];
            
            //隐藏指示条
            _scrollView.showsVerticalScrollIndicator=NO;
            
            [_scrollView addSubview:imgView];
        }
        
        //2.设置scrollview的滚动范围
        CGFloat contentW=5*self.view.frame.size.width;
        _scrollView.contentSize=CGSizeMake(contentW, 0);
        
        //3.设置分页
         _scrollView.pagingEnabled=YES;
        
        //设置当前页  self.pageControl.currentPage=3;
        
        //4.监听scrollView的滚动   --添加代理
        
        _scrollView.delegate=self;
        
        
        [self.view addSubview:_scrollView];
        
    }
    
    return _scrollView;
    
    
}




-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl=[[UIPageControl alloc] init];
        _pageControl.frame=CGRectMake(200, 200, 100, 10);
        _pageControl.numberOfPages=5;
        _pageControl.currentPageIndicatorTintColor=[UIColor grayColor];
        _pageControl.backgroundColor=[UIColor clearColor];
        _pageControl.currentPage=0;
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
    
    
}



-(void) nextImage
{
    
  
    int page=(int)self.pageControl.currentPage;
    
    if (page==4) {
        page=0;
    }else{
        page++;
    }
    
    CGFloat x=page * self.scrollView.frame.size.width;
    
    self.scrollView.contentOffset=CGPointMake(x, 0);
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滚动中");
    
    
    CGFloat scrollViewW=scrollView.frame.size.width;

    CGFloat x=scrollView.contentOffset.x;
    
    int page=(x+scrollViewW/2)/scrollViewW;
   
    self.pageControl.currentPage=page;
    
   
}

// 开始拖拽的时候调用  一开始手动拖拽就关闭定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    //    [self.timer invalidate];
    [self removeTimer];
}


//结束拖拽的时候调用  一结束手动拖拽就关闭定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    开启定时器
    [self addTimer];
}


/**
 *  开启定时器
 */
- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  关闭定时器
 */
- (void)removeTimer
{
    [self.timer invalidate];
}


#pragma mark -
#pragma mark 瀑布流数据源和代理


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (_dataArray.count>5) {
        return _dataArray.count-5;
    }else
    {
        return 1;
    
    }
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    TopicModel *topicObj=_dataArray[indexPath.row+5];
    
    [cell.cellImageView setImageWithURL:[NSURL URLWithString:topicObj.pic]];
    cell.cellTitleLabel.text=topicObj.topicTitle;
    cell.cellDescLabel.text=topicObj.desc;
    cell.cellCollectLabel.text=[NSString stringWithFormat:@"💗%d",topicObj.likes];
    
    
    return cell;
}


@end
