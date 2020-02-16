//
//  UIImageView+corner.h
//  UIKit认识2
//
//  Created by ganshiwei on 2020/1/30.
//  Copyright © 2020 ganshiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (corner)

- (void)addRoundedCorner:(CGFloat)radius cornerRadii:(UIRectCorner)corners;

@end

NS_ASSUME_NONNULL_END
