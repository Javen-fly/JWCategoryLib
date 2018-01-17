//
//  UITextField+JWTools.m
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/10.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import "UITextField+JWTools.h"

@implementation UITextField (JWTools)

- (BOOL)isHighlight
{
    UITextRange *textRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:textRange.start offset:0];
    if (position) {
        return YES;
    }
    return NO;
}

@end
