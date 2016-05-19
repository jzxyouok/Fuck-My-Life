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

- (void)sya_CET:(NSString *)URLString parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress
        success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure
{
    [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}
//[netTool GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//    NSDictionary *adDict = [responseObject[@"ad"] firstObject];
//    
//    self.item = [SYAADItem mj_objectWithKeyValues:adDict];
//    
//    UIImageView *adImageView = [[UIImageView alloc] init];
//    adImageView.userInteractionEnabled = YES;
//    if (self.item.w) {
//        CGFloat h = SYAScreenW / self.item.w * self.item.h;
//        adImageView.frame = CGRectMake(0, 0, SYAScreenW, h);
//    }
//    
//    // 添加点按手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
//    [adImageView addGestureRecognizer:tap];
//    [adImageView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
//    [self.imageView addSubview:adImageView];
//} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    NSLog(@"%@",error);
//}];
//}
//- (NSURLSessionDataTask *)GET:(NSString *)URLString
//                   parameters:(id)parameters
//                     progress:(void (^)(NSProgress * _Nonnull))downloadProgress
//                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
//                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
//{
//    
//    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:@"GET"
//                                                        URLString:URLString
//                                                       parameters:parameters
//                                                   uploadProgress:nil
//                                                 downloadProgress:downloadProgress
//                                                          success:success
//                                                          failure:failure];
//    
//    [dataTask resume];
//    
//    return dataTask;
//}


@end
