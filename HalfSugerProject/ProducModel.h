//
//  ProducModel.h
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProducModel : NSObject


@property(nonatomic,copy)NSString *preductID;
@property(nonatomic,copy)NSString *topic_id;
@property(nonatomic,copy)NSString *number;
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *iscomments;
@property(nonatomic,copy)NSString *comments;
@property(nonatomic,copy)NSString *islike;
@property(nonatomic,copy)NSString *likes;
@property(nonatomic,copy)NSArray *pics;
@property(nonatomic,copy)NSString *item_id;
@property(nonatomic,copy)NSString *platform;
@property(nonatomic,copy)NSString *share_url;

-(instancetype)initWithProductModel:(NSDictionary *)dict;


@end
