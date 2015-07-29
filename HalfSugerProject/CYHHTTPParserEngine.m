//
//  CYHHTTPParserEngine.m
//  HalfSugarProject
//
//  Created by mac on 15-7-28.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "CYHHTTPParserEngine.h"
#import "AFHTTPRequestOperationManager.h"

@implementation CYHHTTPParserEngine



+ (void)requestBannerWithcompletionBlock:(void(^)(NSDictionary *dic))block
{

    NSString *urlString=[NSString stringWithFormat:@"%@",@"http://open3.bantangapp.com/topic/list?app_installtime=1438001584.475024&app_versions=1.1&channel_name=appStore&client_id=bt_app_ipad&client_secret=9700d70626f8bc6ea6bba2570aa658b7&os_versions=8.1&page=0&pagesize=20&screensize=768&track_device_info=iPad&track_deviceid=32DED6FD-9960-43D0-BCB4-BD1E0B7FB5BA&v=1"];
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 );
    //系统自动管理你的请求队列
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //如果报文报content－type错误修改content－type即可。
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
  
    
    [manager GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //NSLog(@"%@",dictionary);
        block((NSDictionary *)responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
    
    
    
}

@end
