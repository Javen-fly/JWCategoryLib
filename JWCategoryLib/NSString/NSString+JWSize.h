//
//  NSString+JWSize.h
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (JWSize)

/** 限制最大宽度，获取文字高度 */
- (CGFloat)jw_heightWithFont:(UIFont *)font maxWidth:(CGFloat)width;
/** 限制最大高度，获取文字宽度 */
- (CGFloat)jw_widthWithFont:(UIFont *)font maxHeight:(CGFloat)height;

/** 限制最大宽度，获取文字大小 */
- (CGSize)jw_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width;
/** 限制最大高度，获取文字大小 */
- (CGSize)jw_sizeWithFont:(UIFont *)font maxHeight:(CGFloat)height;

/** 倒序重组 */
+ (NSString *)jw_reverseString:(NSString *)strSrc;
- (NSString *)jw_reverse;
@end
