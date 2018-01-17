//
//  UIView+JWFrame.h
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/15.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JWFrame)

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGPoint origin;

@property(nonatomic, readonly) CGFloat left;
@property(nonatomic, readonly) CGFloat top;
@property(nonatomic, readonly) CGFloat right;
@property(nonatomic, readonly) CGFloat bottom;

@end
