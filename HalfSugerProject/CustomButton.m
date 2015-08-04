//
//  CustomButton.m
//  HalfSugerProject
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "CustomButton.h"


@implementation CustomButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame imageStr:(NSString *)imageStr labelStr:(NSString *)labelStr
{
    self=[super init];
    if (self) {
        //初始化
        self.frame=frame;
        _imageView=[[UIImageView alloc] init];
        _imageView.frame=CGRectMake(0, 0, self.frame.size.width,self.frame.size.width-4);
        _imageView.image=[UIImage imageNamed:imageStr];
        [self addSubview:_imageView];
        
        _label=[[UILabel alloc] init];
        self.label.frame=CGRectMake(0, self.imageView.frame.size.height+10, self.frame.size.width, self.frame.size.width-self.imageView.frame.size.height+20);
        self.label.textAlignment=NSTextAlignmentCenter;
        self.label.font=[UIFont systemFontOfSize:20];
        self.label.text=labelStr;
        [self addSubview:_label];
    }

    return self;

}

@end
