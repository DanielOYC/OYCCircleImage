//
//  UIImage+Extension.m
//  Quartz2D
//
//  Created by cao on 16/11/25.
//  Copyright © 2016年 daniel. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

//生成一个圆形图像
+(UIImage *)imageWithClipImage:(UIImage *)clipImage{
    
    //0.图像宽高
    CGFloat imageWH = clipImage.size.width;
    
    //1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(clipImage.size, NO, 0);
    
    //2.绘制裁剪区域
    //2.1设置路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imageWH, imageWH)];
    //2.2给路径添加裁剪区域
    [clipPath addClip];
    
    //3.绘制图像到上下文
    [clipImage drawInRect:CGRectMake(0, 0, imageWH, imageWH)];
    
    //4.从当前上下文获取裁剪的图片
    UIImage *clipedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    return clipedImage;
    
}

//获取带圆环的圆形图像
+(UIImage *)imageWithCircle:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    
    //0.一些变量
    CGFloat imageWH = image.size.width;   //图片宽高
    CGFloat contextWH = imageWH + 2 * borderWidth;  //上下文的宽高
    CGSize contextSize = CGSizeMake(contextWH, contextWH);    //上下文的尺寸
    
    //1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0);
    
    //2.绘制大圆环
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, contextWH, contextWH)];
    [borderColor set];
    [ovalPath fill];
    
    //3.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageWH, imageWH)];
    [clipPath addClip];
    
    //4.把图片绘制到上下文
    [image drawInRect:CGRectMake(borderWidth, borderWidth, imageWH, imageWH)];
    
    //5.获取绘制完的图片
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //6.关闭位图上下文
    UIGraphicsEndImageContext();
    
    return circleImage;
    
}

@end
