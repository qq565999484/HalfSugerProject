//
//  CategoryButton.h
//  HalfSugarProject
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 陈一航. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonState){
    ButtonStateUp,
    ButtonStateDown,
};

@interface CategoryButton : UIButton

{
    UIView *_bgView;

}

@property (nonatomic,assign)ButtonState clickState;

@property(nonatomic,copy)NSString *titleStr;


@end
