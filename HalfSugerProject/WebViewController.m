//
//  WebViewController.m
//  HalfSugerProject
//
//  Created by mac on 15-7-31.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "WebViewController.h"
#import "MainViewController.h"


@interface WebViewController ()<UIWebViewDelegate>


@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
                           
    [_webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
       
        
        [_webView loadRequest:request];
        return  YES;

    }else
    {
        return NO;
    }
    
}

- (IBAction)goBackCategory:(id)sender {
    

    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
