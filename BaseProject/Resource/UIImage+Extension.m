//
//  UIImage+Extension.m
//  裁切
//
//  Created by Mac on 16/4/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
//根据传入的图片及边框参数，生成圆形的带边框的图片
+(instancetype)ImageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)boderColor
{
   //加载旧的图片
    UIImage* oldImage = [UIImage imageNamed:imageName];
    
    //新的画布的尺寸
    CGFloat imageWidth = oldImage.size.width+2*border;
    CGFloat imageHeight = oldImage.size.height+2*border;
    
    //设置一个与大圆相切的正方形的宽
    CGFloat circleWidth = MIN(imageHeight, imageWidth);
    
    //开启图片的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleWidth, circleWidth), NO, 0.0);//最后一个参数代表放大
    //画大的圆
    UIBezierPath* circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleWidth, circleWidth)];
    //设置颜色
    [boderColor setFill];
    
    //绘图
    [circlePath fill];
    
    CGRect smallCircle = CGRectMake(border, border, circleWidth-2*border, circleWidth-2*border);
    UIBezierPath* smallPath = [UIBezierPath bezierPathWithOvalInRect:smallCircle];
    [smallPath addClip];
    
    //画原有的旧图
    [oldImage drawInRect:smallCircle];
    UIImage* newImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}


//根据传入的视图内容，生成一张图片
+(instancetype)ImageWithCaptureView:(UIView *)view
{

    //截屏－－生成一张新的图片
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    //渲染控制器的view到上下文
    //图层只能用渲染不能用draw
    //因为此时实在图片上下文区域内
    //所有获取到当前的上下文就是图片的上下文
    CGContextRef content = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:content];
    
    //保存画板上的图片
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //  关闭上下文
    UIGraphicsEndImageContext();
    return newImage;



}
@end
