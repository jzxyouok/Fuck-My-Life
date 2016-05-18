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
@end
