//
//  BannerModel.m
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel

- (instancetype)initWithBanner:(NSDictionary *)dict

{
    self=[super init];
    if (self) {
     
        self.extend=dict[@"extend"];
        self.bannerID=dict[@"id"];
        self.photo=dict[@"photo"];
        self.bannerTitle=dict[@"title"];
        self.type=dict[@"type"];
    }
    return self;
}



@end
