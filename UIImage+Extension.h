//
//  UIImage+Extension.h
//  Quartz2D
//
//  Created by cao on 16/11/25.
//  Copyright © 2016年 daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

//生成一个圆形图片
+(UIImage *)imageWithClipImage:(UIImage *)clipImage;

//获取带圆环的圆形图像
+(UIImage *)imageWithCircle:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
