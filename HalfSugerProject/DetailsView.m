//
//  DetailsView.m
//  HalfSugerProject
//
//  Created by mac on 15-7-31.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "DetailsView.h"
#import "TopicModel.h"
#import "FileCell.h"
#import "DetailInfoTableViewController.H"
@interface DetailsView ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionView *publicCollection;

@end

@implementation DetailsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden=YES;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建导航栏
    [self createCustomNac];
    //注册cell
    [self loadDataSource];
    
    //注册cell
    
    [self.publicCollection registerNib:[UINib nibWithNibName:@"FileCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    
    
    
}

- (void)createCustomNac
{

    _titleLabel.text=self.nacTitle;
    //根据extent发送数据

}

- (void)loadDataSource
{
    _dataArray=[NSMutableArray array];
    
    
    __weak DetailsView *weakSelf=self;
    
    NSLog(@"%@",weakSelf.extend);
    
    [CYHHTTPParserEngine requestBannerByIDS:weakSelf.extend completionBlock:^(NSDictionary *dic) {
        
        NSArray *dataArr=dic[@"data"][@"topic"];
         
         for (int i=0; i<dataArr.count; i++) {
             NSDictionary *dic=dataArr[i];
             TopicModel *topicObj=[[TopicModel alloc] initWithTopic:dic];
            
             
             [weakSelf.dataArray addObject:topicObj];
             
         }
       
         
         [weakSelf.publicCollection reloadData];
         
     }
     
    ];
    

}

- (IBAction)goBackVC:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}






- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
        return self.dataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

            FileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
            
            TopicModel *topicObj=self.dataArray[indexPath.row];
            
            [cell.picView setImageWithURL:[NSURL URLWithString:topicObj.pic]];
            cell.layer.borderWidth=2;
            cell.layer.borderColor=[UIColor grayColor].CGColor;
            cell.picName.text=topicObj.topicTitle;
            cell.picDesc.text=topicObj.desc;
            cell.picLinks.text=[NSString stringWithFormat:@"%d",topicObj.likes];
            
            return cell;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    return CGSizeMake(370, 250);
 
    
}




- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TopicModel *topicObj=_dataArray[indexPath.row];
    
    DetailInfoTableViewController *dvc=[[DetailInfoTableViewController alloc] init];
    dvc.context=[NSString stringWithFormat:@"%d",topicObj.topicID];
    
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
 
    


}

@end
