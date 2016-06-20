//
//  UIImage+Extension.h
//  裁切
//
//  Created by Mac on 16/4/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+(instancetype)ImageWithName:(NSString*)imageName border:(CGFloat)border
                 borderColor:(UIColor*)boderColor;

+(instancetype)ImageWithCaptureView:(UIView*)view;

@end
