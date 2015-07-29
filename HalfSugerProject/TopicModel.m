//
//  TopicModel.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel

- (instancetype)initWithTopic:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        self.desc=dict[@"desc"];
        self.topicID=[dict[@"id"] integerValue];
        self.islike=[dict[@"islike"] integerValue];
        self.likes=[dict[@"likes"]integerValue];
        self.pic=dict[@"pic"];
        self.topicTitle=dict[@"title"];
        self.update_time=dict[@"update_time"];
    }
    return self;

}

@end
