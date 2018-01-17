//
//  UIImage+JWTools.m
//  JWCategoryDemo
//
//  Created by 吴建文 on 2018/1/16.
//  Copyright © 2018年 Javen. All rights reserved.
//

#import "UIImage+JWTools.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage (JWTools)

//图片合成
+ (UIImage *)jw_fotoMixWithImageA:(UIImage *)imageA imageB:(UIImage *)imageB
{
    CGSize imageASize = imageA.size;
    CGSize imageBSize = imageB.size;
    CGFloat w = imageASize.width > imageBSize.width ? imageASize.width : imageBSize.width;
    CGFloat h = imageASize.height > imageBSize.height ? imageASize.height : imageBSize.height;
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    [imageA drawInRect:CGRectMake((w - imageASize.width)/2, (h - imageASize.height)/2, imageASize.width, imageASize.height)];
    [imageB drawInRect:CGRectMake((w - imageBSize.width)/2, (h - imageBSize.height)/2, imageBSize.width, imageBSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//缩放图片
+ (UIImage *)jw_scalingAndCroppingWithImage:(UIImage *)image
                                       size:(CGSize)cropSize{
    CGPoint thumbnailPoint = CGPointZero;
    CGSize  thumbnailSize = CGSizeMake(cropSize.width, cropSize.height);
    
    if (CGSizeEqualToSize(image.size, cropSize) == NO) {
        
        CGFloat widthFactor = cropSize.width / image.size.width;
        CGFloat heightFactor = cropSize.height / image.size.height;
        CGFloat factor = widthFactor < heightFactor ? widthFactor : heightFactor;
        
        thumbnailSize.width = image.size.width * factor;
        thumbnailSize.height = image.size.height * factor;
        
        thumbnailPoint.x = (cropSize.width - thumbnailSize.width) / 2;
        thumbnailPoint.y = (cropSize.height - thumbnailSize.height) / 2;
    }
    
    if ([UIScreen instanceMethodForSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(cropSize, YES, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContextWithOptions(cropSize, YES, 1.0);
    }
    
    [image drawInRect:CGRectMake(thumbnailPoint.x, thumbnailPoint.y,
                                thumbnailSize.width, thumbnailSize.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

//-(UIImage *)imageForMask:(UIImage *)maskImage
//{
//    // The background is either the passed in background image (for the blue selected state) or gray (for the non-selected state)
//    UIImage* backgroundImage = [self backgroundImageWithSize:self.size backgroundImage:maskImage];
//    //
//    //    // Convert the passed in image to a white backround image with a black fill
//    UIImage* bwImage = [self blackFilledImageWithWhiteBackgroundUsing:self];
//    CGSize targetSize = bwImage.size;
//    // Create an image mask
//    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(bwImage.CGImage),
//                                             CGImageGetHeight(bwImage.CGImage),
//                                             CGImageGetBitsPerComponent(bwImage.CGImage),
//                                             CGImageGetBitsPerPixel(bwImage.CGImage),
//                                             CGImageGetBytesPerRow(bwImage.CGImage),
//                                             CGImageGetDataProvider(bwImage.CGImage), NULL, YES);
//
//    // Using the mask create a new image
//    CGImageRef tabBarImageRef = CGImageCreateWithMask(backgroundImage.CGImage, imageMask);
//
//    UIImage* tabBarImage = [UIImage imageWithCGImage:tabBarImageRef scale:self.scale orientation:self.imageOrientation];
//
//    // Cleanup
//    CGImageRelease(imageMask);
//    CGImageRelease(tabBarImageRef);
//
//    // Create a new context with the right size
//    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
//
//    // Draw the new tab bar image at the center
//    [tabBarImage drawInRect:CGRectMake((targetSize.width/2.0) - (self.size.width/2.0), (targetSize.height/2.0) - (self.size.height/2.0), self.size.width, self.size.height)];
//
//    // Generate a new image
//    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return resultImage;
//}

// Convert the image's fill color to black and background to white
//-(UIImage*)blackFilledImageWithWhiteBackgroundUsing:(UIImage*)startImage
//{
//    // Create the proper sized rect
//    CGRect imageRect = CGRectMake(0, 0, CGImageGetWidth(startImage.CGImage), CGImageGetHeight(startImage.CGImage));
//    
//    // Create a new bitmap context
//    CGContextRef context = CGBitmapContextCreate(NULL, imageRect.size.width, imageRect.size.height, 8, 0, CGImageGetColorSpace(startImage.CGImage), (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
//    
//    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
//    CGContextFillRect(context, imageRect);
//    
//    // Use the passed in image as a clipping mask
//    CGContextClipToMask(context, imageRect, startImage.CGImage);
//    // Set the fill color to black: R:0 G:0 B:0 alpha:1
//    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
//    // Fill with black
//    CGContextFillRect(context, imageRect);
//    
//    // Generate a new image
//    CGImageRef newCGImage = CGBitmapContextCreateImage(context);
//    UIImage* newImage = [UIImage imageWithCGImage:newCGImage scale:startImage.scale orientation:startImage.imageOrientation];
//    
//    // Cleanup
//    CGContextRelease(context);
//    CGImageRelease(newCGImage);
//    
//    return newImage;
//}

//-(UIImage*)backgroundImageWithSize:(CGSize)targetSize backgroundImage:(UIImage*)backgroundImage
//{
//    // The background is either the passed in background image (for the blue selected state) or gray (for the non-selected state)
//    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
//    if (backgroundImage)
//    {
//        // Draw the background image centered
//        [backgroundImage drawInRect:CGRectMake((targetSize.width - CGImageGetWidth(backgroundImage.CGImage)) / 2, (targetSize.height - CGImageGetHeight(backgroundImage.CGImage)) / 2, CGImageGetWidth(backgroundImage.CGImage), CGImageGetHeight(backgroundImage.CGImage))];
//    }
//    else
//    {
//        [[UIColor lightGrayColor] set];
//        UIRectFill(CGRectMake(0, 0, targetSize.width, targetSize.height));
//    }
//    
//    UIImage* finalBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return finalBackgroundImage;
//}

+ (UIImage *)jw_imageWithColor:(UIColor *)color
                          size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/** 根据颜色生成带圆角图片 */
+ (UIImage *)jw_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                  cornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0.f, 0.f);
    CGPathAddArc(path, &transform, radius, radius, radius, -M_PI, -M_PI/2, NO);
    CGPathAddLineToPoint(path, &transform, size.width - radius, 0);
    CGPathAddArc(path, &transform, size.width - radius, radius, radius, -M_PI/2, 0, NO);
    CGPathAddLineToPoint(path, &transform, size.width, size.height - radius);
    CGPathAddArc(path, &transform, size.width - radius, size.height - radius, radius, 0, M_PI/2, NO);
    CGPathAddLineToPoint(path, &transform, radius, size.height);
    CGPathAddArc(path, &transform, radius, size.height - radius, radius, M_PI/2, M_PI, NO);
    
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);
    [color setFill];
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGPathRelease(path);
    return image;
    
}

+ (UIImage *)jw_boxblurImageWithImage:(UIImage *)image blur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    // create unchanged copy of the area inside the exclusionPath
    UIImage *unblurredImage = nil;
    if (exclusionPath != nil) {
        CAShapeLayer *maskLayer = [CAShapeLayer new];
        maskLayer.frame = (CGRect){CGPointZero, image.size};
        maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        maskLayer.fillColor = [UIColor whiteColor].CGColor;
        maskLayer.path = exclusionPath.CGPath;
        
        // create grayscale image to mask context
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        CGContextRef context = CGBitmapContextCreate(nil, maskLayer.bounds.size.width, maskLayer.bounds.size.height, 8, 0, colorSpace, 0);
        CGContextTranslateCTM(context, 0, maskLayer.bounds.size.height);
        CGContextScaleCTM(context, 1.f, -1.f);
        [maskLayer renderInContext:context];
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        UIImage *maskImage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        CGColorSpaceRelease(colorSpace);
        CGContextRelease(context);
        
        UIGraphicsBeginImageContext(image.size);
        context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, 0, maskLayer.bounds.size.height);
        CGContextScaleCTM(context, 1.f, -1.f);
        CGContextClipToMask(context, maskLayer.bounds, maskImage.CGImage);
        CGContextDrawImage(context, maskLayer.bounds, image.CGImage);
        unblurredImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             5);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    // overlay images?
    if (unblurredImage != nil) {
        UIGraphicsBeginImageContext(returnImage.size);
        [returnImage drawAtPoint:CGPointZero];
        [unblurredImage drawAtPoint:CGPointZero];
        
        returnImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
