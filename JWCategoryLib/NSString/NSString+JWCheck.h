//
//  NSString+JWCheck.h
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//  字符串检测

#import <Foundation/Foundation.h>

@interface NSString (JWCheck)

/** 是否是手机号格式 */
- (BOOL)isPhoneNumber;

/** 是否是邮件格式 */
- (BOOL)isEmail;

/** 是否是中文 */
- (BOOL)isChinese;

/** 是否正在编辑小数格式 */
- (BOOL)isEditingDecimalNumber;

/** 是否是身份证号码(15位 或者 18位) */
- (BOOL)isIDCardFormat;

/** 是否是车牌号 */
- (BOOL)isCardNumber;

/** 是否是2-5位的中文名 */
- (BOOL)isChineseName;

/** 是否是空格或则换行 */
- (BOOL)isWhitespaceAndNewlines;

/** 是否为空，空格、换行都为空 */
- (BOOL)isBlank;
@end
