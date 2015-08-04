//
//  HeaderView.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HeaderView : UIView

@property(nonatomic,copy)NSString *titleLabel;
@property(nonatomic,copy)NSString *imgStr;


-(instancetype)initWithFrame:(CGRect)frame textLabel:(NSString *)titleLabel imgStr:(NSString *)imgStr;


@end
