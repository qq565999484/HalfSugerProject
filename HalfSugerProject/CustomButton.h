//
//  CustomButton.h
//  HalfSugerProject
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIControl

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIImageView *imageView;

-(id)initWithFrame:(CGRect)frame imageStr:(NSString *)imageStr labelStr:(NSString *)labelStr;

@end
