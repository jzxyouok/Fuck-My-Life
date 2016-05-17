//
//  UIImage+SYAImage.m
//  BaiSiBuDeJie
//
//  Created by zengqiang on 16/4/25.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "UIImage+SYAImage.h"

@implementation UIImage (SYAImage)
// 返回一张未经过渲染的图片

+ (UIImage *)imageWithRenderImageName:(NSString *)imageName

{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
