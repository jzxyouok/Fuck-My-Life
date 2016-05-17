//
//  UIBarButtonItem+SYABarButtonItem.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "UIBarButtonItem+SYABarButtonItem.h"

@implementation UIBarButtonItem (SYABarButtonItem)
+ (UIBarButtonItem *)barButtonItemNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectImage:(UIImage *)selectImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    [btn setImage:selectImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 给btn包装一个uiview可以解决点击按钮范围扩大的问题
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (UIBarButtonItem *)barButtonItemNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectImage:(UIImage *)selectImage title:(NSString *) title contentInset:(UIEdgeInsets) rect target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    [btn setImage:selectImage forState:UIControlStateSelected];
    /*
     ******个人喜欢黑色和红色,故此处写死按钮的颜色和文字颜色,需要修改的外部可以直接改
     */
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    btn.contentEdgeInsets = rect;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 给btn包装一个uiview可以解决点击按钮范围扩大的问题
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}


@end
