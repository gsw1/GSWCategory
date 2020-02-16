//
//  UIImageView+corner.m
//  UIKit认识2
//
//  Created by ganshiwei on 2020/1/30.
//  Copyright © 2020 ganshiwei. All rights reserved.
//

#import "UIImageView+corner.h"


@implementation UIImageView (corner)

- (void)addRoundedCorner:(CGFloat)radius cornerRadii:(UIRectCorner)corners {
    if (self.image) {
        self.image = [self cornerImage:self.image frame:self.bounds cornerRadii:corners radius:radius];
    }
}

- (UIImage *)cornerImage:(UIImage *)image frame:(CGRect)rect cornerRadii:(UIRectCorner)corners radius:(CGFloat)radius{
    if (rect.size.width == 0) {
        rect = CGRectMake(0, 0, image.size.width, image.size.height);
    }
//    CGSize size = image.size;
    //设置完image后在对image形状做出改变然后在设置image
    //先clip出corner形状再draw image
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(contextRef, path.CGPath);
  
    CGContextClip(contextRef);
    [image drawInRect:rect];
    UIImage *cornerImage = UIGraphicsGetImageFromCurrentImageContext();
//    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIGraphicsEndImageContext();
    return cornerImage;
}

@end
