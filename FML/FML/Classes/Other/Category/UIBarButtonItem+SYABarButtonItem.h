//
//  UIBarButtonItem+SYABarButtonItem.h
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SYABarButtonItem)
/**
 *  设置导航条按钮
 *
 *  @param normalImage    正常状态下的图片
 *  @param highlightImage 高亮状态下的图片
 *  @param selectImage    选中状态下的图片
 *  @param target         点击监听者
 *  @param action         点击时调用的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)barButtonItemNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectImage:(UIImage *)selectImage target:(id)target action:(SEL)action;
/**
 *  设置导航条返回按钮,更多参数
 *
 *  @param normalImage    正常状态下的图片
 *  @param highlightImage 高亮状态下的图片
 *  @param selectImage    选中状态下的图片
 *  @param title          按钮标题
 *  @param rect           按钮内边距,传入UIEdgeInsets结构体
 *  @param target         点击监听者
 *  @param action         点击时调用的方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)barButtonItemNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectImage:(UIImage *)selectImage title:(NSString *) title contentInset:(UIEdgeInsets) rect target:(id)target action:(SEL)action;

@end
