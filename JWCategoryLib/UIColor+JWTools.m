//
//  UIColor+JWTools.m
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import "UIColor+JWTools.h"

@implementation UIColor (JWTools)

+ (UIColor *)jw_colorWithHexString:(NSString *)hexColorStr;
{
    return [UIColor jw_colorWithHexString:hexColorStr alpha:1.f];
}
+ (UIColor *)jw_colorWithHexString:(NSString *)hexColorStr alpha:(CGFloat)alpha
{
    NSRange range = [hexColorStr rangeOfString:@"#"];
    if (range.location != NSNotFound) {
        hexColorStr = [hexColorStr stringByReplacingCharactersInRange:range withString:@"0x"];
    }
    if ([hexColorStr rangeOfString:@"0x"].location == NSNotFound) {
        hexColorStr = [@"0x" stringByAppendingString:hexColorStr];
    }
    long colorLong = strtoul([hexColorStr cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    int r = (colorLong & 0xFF0000) >> 16;
    int g = (colorLong & 0x00FF00) >> 8;
    int b = colorLong & 0x0000FF;
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}
@end
