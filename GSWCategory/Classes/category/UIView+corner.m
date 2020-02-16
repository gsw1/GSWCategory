//
//  UIView+corner.m
//  UIKit认识2
//
//  Created by ganshiwei on 2020/1/31.
//  Copyright © 2020 ganshiwei. All rights reserved.
//

#import "UIView+corner.h"



@implementation UIView (corner)

- (void)addCornerWithRadius:(CGFloat)radius corners:(UIRectCorner)radii backgroundColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    if ( self.subviews.count > 0 && [self.subviews[0] isKindOfClass:[UIImageView class]]) {
         return;
     }
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderColor = [[UIColor clearColor] CGColor];
    self.layer.borderWidth = 0.0;
    [self insertCornerImageViewWithRadius:radius corners:radii backgroundColor:bgColor borderColor:borderColor borderWidth:borderWidth];
}


- (void)insertCornerImageViewWithRadius:(CGFloat)radius  corners:(UIRectCorner)radii backgroundColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    //view设置category，addCorderWithRadius：(CGFloat)radius corners:(UIRectCorner)radii;
    //设置view的backgroundColor为clear
    //设置view.layer.borderWidth为0，
    //设置fill为背景色，strokecolor为borderColor，strokeLineWidth为borderWidth
    CGRect rect = self.bounds;
//    CGFloat width = rect.size.width;
//    CGFloat height = rect.size.height;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, bgColor.CGColor);
    CGContextSetStrokeColorWithColor(contextRef, borderColor.CGColor);
    CGContextSetLineWidth(contextRef, borderWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:radii cornerRadii:CGSizeMake(radius, radius)];
////
//    CGContextMoveToPoint(contextRef, width, radius );
//      CGContextAddArcToPoint(contextRef, width , height , width - radius , height , radius);  // 右下角角度
//      CGContextAddArcToPoint(contextRef, 0, height , 0, height - radius, radius); // 左下角角度
//      CGContextAddArcToPoint(contextRef, 0, 0, radius , 0, radius); // 左上角
//      CGContextAddArcToPoint(contextRef, width , 0, width , radius , radius); // 右上角


    CGContextAddPath(contextRef, path.CGPath);
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self insertSubview:imageView atIndex:0];
    
}

@end
