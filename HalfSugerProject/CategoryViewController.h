//
//  CategoryViewController.h
//  HalfSugerProject
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController


@property(nonatomic,strong)UICollectionView *categoryCollectionView;
@property (nonatomic,copy)NSString *labelText;

@property(nonatomic,strong)NSArray *categoryArray;


-(void)dataSource:(NSArray *)dataArray;

@end
