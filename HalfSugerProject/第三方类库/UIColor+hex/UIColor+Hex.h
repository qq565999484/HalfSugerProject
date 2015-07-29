//
//  UIColor+Hex.h
//  MIT_itrade
//
//  Created by  on 13-5-14.
//  Copyright (c) 2013年 ______. All rights reserved.
//

/*********************************
 文件名: UIColor+Hex.h
 功能描述: 16进制转UIColor
 创建人: 
 修改日期: 2013.5.14
 *********************************/
#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString: (NSString *) stringToConvert;
+ (UIColor *)colorWithSETPRICE:(NSString *)SETPRICE price:(NSString*)PRICE;
+ (UIColor *)colorWithRAISELOSE:(NSString *)RAISELOSE;
@end
