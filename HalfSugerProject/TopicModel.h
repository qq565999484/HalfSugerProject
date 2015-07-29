//
//  TopicModel.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,assign)int topicID;
@property(nonatomic,assign)int islike;
@property(nonatomic,assign)int likes;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *topicTitle;
@property(nonatomic,copy)NSString *update_time;

- (instancetype)initWithTopic:(NSDictionary *)dict;
@end
