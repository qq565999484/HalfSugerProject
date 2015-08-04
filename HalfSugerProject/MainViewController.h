//
//  MainViewController.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController




//分类的那个label(那个button下面的label)
@property (weak, nonatomic) IBOutlet UILabel *categoryButton;

@property (weak, nonatomic) IBOutlet UIImageView *changeImageView;

@property (weak, nonatomic) IBOutlet UIScrollView *isHiddenTitleView;

@property (weak, nonatomic) IBOutlet UICollectionView *publicCollection;


@end
