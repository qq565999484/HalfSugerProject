//
//  CYHViewController.m
//  HalfSugerProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import "CYHViewController.h"
#import "MainViewController.h"

@interface CYHViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UIView *splitView;

@end

@implementation CYHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     _label1.alpha=0;
     _label2.alpha=0;
     _label3.alpha=0;
     _label4.alpha=0;
    _splitView.hidden=YES;
    [self performSelector:@selector(launchMainView) withObject:self afterDelay:2];
    
    
}
-(void)launchMainView
{
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0F];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    _label1.alpha=1;
    [_label1 setText:@"全世界"];
    _splitView.hidden=NO;
    
    [UIView setAnimationDidStopSelector:@selector(label2HiddenNo)];
    [UIView commitAnimations];
    
}

-(void)label2HiddenNo
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:3.0F];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _label2.text=@"de";
    _label2.alpha=1;
    _label3.text=@"好";
    _label3.alpha=1;
    _label4.text=@"东西";
    _label4.alpha=1;
    [UIView setAnimationDidStopSelector:@selector(MainViewDisplay)];
    [UIView commitAnimations];
    
}



-(void)MainViewDisplay
{
    
    //创建自定义导航栏  将自定义导航栏设置成rootView 将首页设置成rootNavView
 
    
    
    UINavigationController *mainNC=[[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController=mainNC;
    
    
}



@end
