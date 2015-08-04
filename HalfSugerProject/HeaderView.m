//
//  HeaderView.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "HeaderView.h"
#import "CategoryButton.h"
#import "CustomButton.h"



@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}




-(instancetype)initWithFrame:(CGRect)frame textLabel:(NSString *)titleLabel imgStr:(NSString *)imgStr
{
    self.titleLabel=titleLabel;
    self.imgStr=imgStr;
    self.frame=frame;
    self=[super init];
    if (self) {
        
        //创建一个logo
        UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        imageView.frame=CGRectMake(0, 0, 64, 64);
        [self addSubview:imageView];
        
       //UIButton
        
    }
    
    return self;
    

}



@end
