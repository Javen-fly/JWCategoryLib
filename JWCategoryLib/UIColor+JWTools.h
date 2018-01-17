//
//  UIColor+JWTools.h
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JWTools)

+ (UIColor *)jw_colorWithHexString:(NSString *)hexColor;
+ (UIColor *)jw_colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha;

@end
