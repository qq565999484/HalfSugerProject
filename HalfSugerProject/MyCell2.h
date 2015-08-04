//
//  MyCell2.h
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellDesc;
@property (weak, nonatomic) IBOutlet UIImageView *bgView1;
@property (weak, nonatomic) IBOutlet UIImageView *bgView2;
@property (weak, nonatomic) IBOutlet UIImageView *bgView3;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *caregoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
