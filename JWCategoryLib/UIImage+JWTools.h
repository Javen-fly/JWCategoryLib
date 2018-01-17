//
//  UIImage+JWTools.h
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/16.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_OPTIONS(NSInteger, JWImageFotoModel) {
//    JWImageFotoModelCenter  = 0,
//    JWImageFotoModelTop     = 1 << 1,
//    JWImageFotoModelBottom  = 1 << 2,
//    JWImageFotoModelLeft    = 1 << 3,
//    JWImageFotoModelRight   = 1 << 4
//};

@interface UIImage (JWTools)

/** 照片合成 */
+ (UIImage *)jw_fotoMixWithImageA:(UIImage *)imageA
                        imageB:(UIImage *)imageB;

/** 图片缩放 */
+ (UIImage *)jw_scalingAndCroppingWithImage:(UIImage *)image
                                       size:(CGSize)cropSize;

//-(UIImage *)imageForMask:(UIImage *)maskImage;

/** 由颜色产生图片 */
+ (UIImage *)jw_imageWithColor:(UIColor *)color
                          size:(CGSize)rect;

/** 根据颜色生成带圆角图片 */
+ (UIImage *)jw_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                  cornerRadius:(CGFloat)radius;

//+ (UIImage *)resizedImageWithName:(NSString *)name;
//+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
// UIImage的磨砂效果
+ (UIImage *)jw_boxblurImageWithImage:(UIImage *)image
                                 blur:(CGFloat)blur
                        exclusionPath:(UIBezierPath *)exclusionPath;

@end
