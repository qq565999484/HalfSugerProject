//
//  CategoryButton.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "CategoryButton.h"

@implementation CategoryButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//需要一个label.label上的值是动态加载的

-(instancetype)init
{
    
    self=[super init];
    if (self) {
        
        _bgView=[[UIView alloc] init];
        _bgView.frame=CGRectMake(0, 0, 70, 40);
        [self addSubview:_bgView];
        
        //这个上面需要添加一个label和一个图片视图 lebel的字是根据通知获取和这个类没有关系 视图根据状态
        
        
        
        
    }

    return self;
}


-(void)setClickState:(ButtonState )clickState
{
    _clickState=clickState;
    switch (clickState) {
        case ButtonStateUp:
        {
            //将小图标的角朝上
            
            
        }
            break;
        case ButtonStateDown:
        {
            //将小图标的角朝下
            
        }
            break;
    }
    
    
}

@end
