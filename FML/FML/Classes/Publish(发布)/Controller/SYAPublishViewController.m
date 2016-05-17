//
//  SYAPublishViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAPublishViewController.h"

@interface SYAPublishViewController ()

@end

@implementation SYAPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
