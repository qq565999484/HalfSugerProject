//
//  DataMedel.m
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "DataMedel.h"

@implementation DataMedel

-(id)initWithDataModel:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        self.dataID=dict[@"id"];
        self.dataCategory=dict[@"category"];
        self.dataTitle=dict[@"title"];
        self.dataDesc=dict[@"desc"];
        self.dataPic=dict[@"pic"];
        self.dataWidth=dict[@"width"];
        self.dataHeight=dict[@"height"];
        self.dataShare_url=dict[@"share_url"];
        self.dataShare_pic=dict[@"share_pic"];
        self.dataIslike=dict[@"islike"];
    }
    
    return self;
    
}

@end
