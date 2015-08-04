//
//  CYHHTTPParserEngine.h
//  HalfSugarProject
//
//  Created by mac on 15-7-28.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYHHTTPParserEngine : NSObject



+ (void)requestBannerByPageNum:(int)page completionBlock:(void(^)(NSDictionary *dic))block;


+ (void)requestBannerByCategoryID:(int)category completionBlock:(void(^)(NSDictionary *dic))block;

+ (void)requestBannerByIDS:(NSString *)ids completionBlock:(void(^)(NSDictionary *dic))block;

+ (void)requestBannerByID:(NSString *)topicID completionBlock:(void(^)(NSDictionary *dic))block;
@end
