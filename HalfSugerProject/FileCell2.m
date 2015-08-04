//
//  FileCell.m
//  YiChat
//
//  Created by 孙 化育 on 14-11-12.
//  Copyright (c) 2014年 孙 化育. All rights reserved.
//

#import "FileCell2.h"
#import "BannerModel.h"

@implementation FileCell2



-(void)awakeFromNib
{
    self.CellScrollView.showsVerticalScrollIndicator=NO;
    self.CellScrollView.frame=self.frame;
    _CellScrollView.delegate=self;
    self.pageController.currentPage=0;
    
    [self addTimer];
}


-(void)recognizeMethod:(UIGestureRecognizer *)recognizer
{
    if (recognizer.numberOfTouches==1) {
         NSLog(@"11");
    }
   

}

#pragma mark -
#pragma mark 滑块相关

-(void) nextImage
{
    
    
    int page=(int)self.pageController.currentPage;
    
    if (page==4) {
        page=0;
    }else{
        page++;
    }
    
    CGFloat x=page * 768;
    
    _CellScrollView.contentOffset=CGPointMake(x, 0);
    
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    
    CGFloat scrollViewW=scrollView.frame.size.width;
    
    CGFloat x=scrollView.contentOffset.x;
    
    int page=(x+scrollViewW/2)/scrollViewW;
    
    _pageController.currentPage=page;
    
    
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


@end
