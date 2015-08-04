//
//  FileCell.h
//  YiChat
//
//  Created by 孙 化育 on 14-11-12.
//  Copyright (c) 2014年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileCell2:UICollectionViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *CellScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,strong)NSArray *bannerArr;

@end
