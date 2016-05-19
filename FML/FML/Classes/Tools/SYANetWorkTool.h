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

- (void)sya_GET:(NSString *)URLString parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress
        success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;


@end
