//
//  UIView+corner.h
//  UIKit认识2
//
//  Created by ganshiwei on 2020/1/31.
//  Copyright © 2020 ganshiwei. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (corner)

- (void)addCornerWithRadius:(CGFloat)radius corners:(UIRectCorner)radii backgroundColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
