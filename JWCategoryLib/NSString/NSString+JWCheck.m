//
//  NSString+JWCheck.m
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import "NSString+JWCheck.h"

@implementation NSString (JWCheck)


- (BOOL)isPhoneNumber
{
    NSString *mobileRegex = @"^(13[0-9]|1[5-9][0-9])[0-9]{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobileRegex];
    return  [predicate evaluateWithObject:self];
}
- (BOOL)isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return  [predicate evaluateWithObject:self];
}
- (BOOL)isChinese
{
    NSString *limit = @"[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",limit];
    return  [predicate evaluateWithObject:self];
}
- (BOOL)isEditingDecimalNumber
{
    NSString *numberRegex = @"^[0-9]*[1-9][0-9]*+(\\.[0-9]*)?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return  [predicate evaluateWithObject:self];
}

- (BOOL)isIDCardFormat
{
    NSString *limit = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",limit];
    return  [predicate evaluateWithObject:self];
}

- (BOOL)isCardNumber
{
    if (self.length != 7) {
        return NO;
    }
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHS %@",carRegex];
    return [carPredicate evaluateWithObject:self];
}

- (BOOL)isChineseName
{
    NSString *limit = @"[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",limit];
    return  [predicate evaluateWithObject:self];
}

- (BOOL)isWhitespaceAndNewlines {
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isBlank
{
    if (self == nil || self.length == 0 || ![self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ) {
        return YES;
    }
    return NO;
}
@end
