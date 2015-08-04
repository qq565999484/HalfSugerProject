//
//  DataMedel.h
//  HalfSugerProject
//
//  Created by mac on 15-8-3.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProducModel;

@interface DataMedel : NSObject

@property(nonatomic,copy)NSString *dataID;
@property(nonatomic,copy)NSString *dataCategory;
@property(nonatomic,copy)NSString *dataTitle;
@property(nonatomic,copy)NSString *dataDesc;
@property(nonatomic,copy)NSString *dataPic;
@property(nonatomic,copy)NSString *dataWidth;
@property(nonatomic,copy)NSString *dataHeight;
@property(nonatomic,copy)NSString *dataShare_url;
@property(nonatomic,copy)NSString *dataShare_pic;
@property(nonatomic,copy)NSString *dataIslike;



-(id)initWithDataModel:(NSDictionary *)dict;

@end
