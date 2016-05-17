//
//  SYATabBar.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYATabBar.h"
#import "SYAPublishViewController.h"

@interface SYATabBar ()

@property (nonatomic, strong) UIButton *publishBtn;

@end
@implementation SYATabBar

+ (instancetype)tabBar

{
    return [[self alloc] init];
}

- (UIButton *)publishBtn

{
    if (_publishBtn == nil) {
        _publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [_publishBtn sizeToFit];
        [self addSubview:_publishBtn];
        [_publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishBtn;
}
#pragma mark - 点击按钮,modal出控制器
- (void)publishBtnClick

{
    SYAPublishViewController *publishVC = [[SYAPublishViewController alloc] init];
    [self.window.rootViewController presentViewController:publishVC animated:YES completion:nil];
}

#pragma mark - 布局子控件

- (void)layoutSubviews

{
    [super layoutSubviews];
    NSInteger count = self.items.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = SYAScreenW / (count + 1);
    CGFloat btnH = self.sya_height;
    
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i ++;
        }
    }
    //添加加号按钮
    self.publishBtn.center = CGPointMake(self.sya_width * 0.5, self.sya_height * 0.5);

}
@end
