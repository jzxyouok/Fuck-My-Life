//
//  SYANetWorkTool.m
//  FML
//
//  Created by zengqiang on 16/5/18.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYANetWorkTool.h"

@implementation SYANetWorkTool

+ (instancetype)shareNetWorkTool
{
    SYANetWorkTool *shareNetWorkTool = [[SYANetWorkTool alloc] init];
    NSSet *set = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
 
    shareNetWorkTool.responseSerializer.acceptableContentTypes = set;
    return shareNetWorkTool;
}

- (void)sya_GET:(NSString *)URLString parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress
        success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure
{
    [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}



@end
