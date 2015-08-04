//
//  WebViewController.h
//  HalfSugerProject
//
//  Created by mac on 15-7-31.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic,copy)NSString *urlStr;

@end
