//
//  DetailInfoTableViewController.m
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "DetailInfoTableViewController.h"
#import "DetailsView.h"
#import "ProducModel.h"
#import "DataMedel.h"
#import "MyCell1.h"
#import "MyCell2.h"
#import "WebViewController.h"

@interface DetailInfoTableViewController ()

@property(nonatomic,copy)NSString *imgStr;
@property(nonatomic,copy)NSString *descStr;

@property(nonatomic,copy)NSMutableArray *dataArray;
@property(nonatomic,copy)NSMutableArray *preductArray;
@end

@implementation DetailInfoTableViewController
@synthesize context;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // self.navigationController.navigationBarHidden=NO;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //加载数据源
    _dataArray=[[NSMutableArray alloc] initWithCapacity:0];
    _preductArray=[[NSMutableArray alloc] initWithCapacity:0];
    
    __weak DetailInfoTableViewController *weakSelf=self;
    
    [CYHHTTPParserEngine requestBannerByID:self.context completionBlock:^(NSDictionary *dic) {
    
   
        DataMedel *dataObj=[[DataMedel alloc] initWithDataModel:dic[@"data"]];
        weakSelf.imgStr=dic[@"data"][@"pic"];
        weakSelf.descStr=dic[@"data"][@"desc"];
        
        [weakSelf.dataArray addObject:dataObj];
    
        
        NSArray *array=dic[@"data"][@"product"];
        for (int i=0; i<array.count; i++) {
            ProducModel *product=[[ProducModel alloc] initWithProductModel:array[i]];
            [weakSelf.preductArray addObject:product];
            
        }
     
        [self.tableView reloadData];
        
    }];
    //注册表格
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell1" bundle:nil] forCellReuseIdentifier:@"section0"];
     [self.tableView registerNib:[UINib nibWithNibName:@"MyCell2" bundle:nil] forCellReuseIdentifier:@"section1"];
    
    //添加返回栏
    
    

}

- (void)goBackVC:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section==0) {
        return 1;
    }
    return self.preductArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0) {
        // DataMedel *data=_dataArray[indexPath.row];
        // Configure the cell...
        MyCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"section0"];
        
        [cell.bgView setImageWithURL:[NSURL URLWithString:self.imgStr]];
        cell.descLabel.text=self.descStr;
        return cell;
    }
    
    
    else {
       //从这个开始一点点的布局
       
        
        //获得对象
        ProducModel *pm=_preductArray[indexPath.row];
        //获得注册cell
        MyCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"section1"];
        
        //开始布局 view
        cell.titleView.frame=CGRectMake(0, 0, 768, 64);
        cell.titleView.backgroundColor=[UIColor grayColor];
        cell.titleView.layer.borderWidth=1;
        
        cell.caregoryLabel.text=pm.category;
        cell.titleLabel.text=pm.title;
        
        //首先是一串文字描述
        
        CGRect rect = [pm.desc boundingRectWithSize:CGSizeMake(720, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        cell.cellDesc.frame=CGRectMake(20, 80, 720, rect.size.height+20);
        cell.cellDesc.text=pm.desc;
        
        //这个时候文字的高度是
        
        
        
        if (pm.pics.count==3) {
            [cell.bgView1 setImageWithURL:[NSURL URLWithString:pm.pics[0][@"pic"]]];
            [cell.bgView2 setImageWithURL:[NSURL URLWithString:pm.pics[1][@"pic"]]];
            [cell.bgView3 setImageWithURL:[NSURL URLWithString:pm.pics[2][@"pic"]]];
            //起始的高度
            cell.bgView1.frame=CGRectMake(200, 80+rect.size.height+20, 400, 300);
            cell.bgView2.frame=CGRectMake(200, 380+rect.size.height+20, 400, 300);
            cell.bgView3.frame=CGRectMake(200, 680+rect.size.height+20, 400, 300);
             cell.detailButton.frame=CGRectMake(500,610+rect.size.height+20+300+20 , 80,50 );
            
            
        }else if(pm.pics.count==2)
        {
            [cell.bgView1 setImageWithURL:[NSURL URLWithString:pm.pics[0][@"pic"]]];
            [cell.bgView2 setImageWithURL:[NSURL URLWithString:pm.pics[1][@"pic"]]];
            cell.bgView1.frame=CGRectMake(200, 80+rect.size.height+20, 400, 300);
            cell.bgView2.frame=CGRectMake(200, 380+rect.size.height+20, 400, 300);
            cell.detailButton.frame=CGRectMake(500,680+rect.size.height+20 , 80,50 );
        }else
        {
            [cell.bgView1 setImageWithURL:[NSURL URLWithString:pm.pics[0][@"pic"]]];
            cell.bgView1.frame=CGRectMake(200, 80+rect.size.height+20, 400, 300);
            cell.detailButton.frame=CGRectMake(500,380+rect.size.height+20 , 80,50 );
        }
        
        
        cell.priceLabel.text=pm.price;
       
        
        cell.detailButton.tag=indexPath.row;
        
        [cell.detailButton addTarget:self action:@selector(clickGotoDetailHtml:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }

}


- (void)clickGotoDetailHtml:(UIButton *)button
{
    ProducModel *product=_preductArray[button.tag];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:product.share_url]];


}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (indexPath.section==0) {
        return 400;
    }else
    {
        ProducModel *pm=_preductArray[indexPath.row];
     
            
        CGRect rect = [pm.desc boundingRectWithSize:CGSizeMake(720, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
            
            
            
        if (pm.pics.count==3) {
              
                return rect.size.height+30+500*3+80*2;
        
        }else if(pm.pics.count==2){
        
                return rect.size.height+30+450*2+80*2;
        }else
        {
                return rect.size.height+30+400+80*2;
        }
    }
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    UIView *view=[[UIView alloc] init];
    if(section==0){
    
    view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    view.backgroundColor=[UIColor clearColor];
 
    //[tableView addSubview:view];
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(20, 20, 60, 60);
    rightButton.layer.cornerRadius=30;
    rightButton.layer.masksToBounds=YES;
    [rightButton setImage:[UIImage imageNamed:@"btn_back_red"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(goBackVC:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:rightButton];
        view.alpha=0.6;

    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    if (section==0) {
        return 100;
    }else
    {
        return 0;
    }

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        ProducModel *pm=_preductArray[indexPath.row];
         WebViewController *webView=[[WebViewController alloc] init];
        webView.urlStr=[pm.url copy];
        [self.navigationController pushViewController:webView animated:YES];
        
    }
}
@end
