//
//  MyCell.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell

//上面的视图 说不定还是button....
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
//标题
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;

//描述
@property (weak, nonatomic) IBOutlet UILabel *cellDescLabel;
//收藏数
@property (weak, nonatomic) IBOutlet UILabel *cellCollectLabel;

@end
