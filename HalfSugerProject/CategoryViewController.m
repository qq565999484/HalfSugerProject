//
//  CategoryViewController.m
//  HalfSugerProject
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc] init];
    label.frame=self.view.frame;
    label.text=self.labelText;
    label.font=[UIFont systemFontOfSize:50];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
}

-(void)dataSource:(NSArray *)dataArray
{
    self.categoryArray=dataArray;

}


@end
