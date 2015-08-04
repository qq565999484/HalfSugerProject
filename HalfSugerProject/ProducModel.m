//
//  ProducModel.m
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "ProducModel.h"

@implementation ProducModel

-(instancetype)initWithProductModel:(NSDictionary *)dict
{

    self=[super init];
    if (self) {
        
        self.preductID=dict[@"id"];
        self.topic_id=dict[@"topic_id"];
        self.number=dict[@"number"];
        self.category=dict[@"category"];
        self.title=dict[@"title"];
        self.desc=dict[@"desc"];
        self.price=dict[@"price"];
        self.url=dict[@"url"];
        self.iscomments=dict[@"iscomments"];
        self.comments=dict[@"comments"];
        self.islike=dict[@"islike"];
        self.likes=dict[@"likes"];
        self.pics=dict[@"pic"];
        self.item_id=dict[@"items_id"];
        self.platform=dict[@"platform"];
        self.share_url=dict[@"share_url"];
        
    }
    return self;
    

}
@end
