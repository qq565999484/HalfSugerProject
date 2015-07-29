//
//  CYHHTTPParserEngine.h
//  HalfSugarProject
//
//  Created by mac on 15-7-28.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYHHTTPParserEngine : NSObject


+ (void)requestBannerWithcompletionBlock:(void(^)(NSDictionary *dic))block;

@end
