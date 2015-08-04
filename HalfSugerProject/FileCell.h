//
//  FileCell.h
//  YiChat
//
//  Created by 孙 化育 on 14-11-12.
//  Copyright (c) 2014年 孙 化育. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FileCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UILabel *picName;
@property (weak, nonatomic) IBOutlet UILabel *picDesc;
@property (weak, nonatomic) IBOutlet UILabel *picLinks;

@end
