//
//  SYANetWorkTool.h
//  FML
//
//  Created by zengqiang on 16/5/18.
//  Copyright © 2016年 zengqiang. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

@interface SYANetWorkTool : AFHTTPSessionManager

+ (instancetype)shareNetWorkTool;


@end
