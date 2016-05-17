//
//  UIBarButtonItem+SYABarButtonItem.h
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SYABarButtonItem)

+ (UIBarButtonItem *)barButtonItemNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectImage:(UIImage *)selectImage target:(id)target action:(SEL)action;

@end
