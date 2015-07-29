//
//  BannerModel.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject


@property(nonatomic,copy)NSString *extend;
@property(nonatomic,copy)NSString *bannerID;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *bannerTitle;
@property(nonatomic,copy)NSString *type;
- (instancetype)initWithBanner:(NSDictionary *)dict;


@end
