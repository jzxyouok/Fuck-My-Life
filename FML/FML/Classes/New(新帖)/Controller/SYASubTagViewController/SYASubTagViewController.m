//
//  SYASubTagViewController.m
//  FML
//
//  Created by zengqiang on 16/5/19.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYASubTagViewController.h"
#import "SYANetWorkTool.h"
#import <MJExtension/MJExtension.h>
#import "SYASubTagItem.h"
@interface SYASubTagViewController ()
@property (nonatomic, strong) NSMutableArray *subTagItemArray;
@end

@implementation SYASubTagViewController

- (NSMutableArray *)subTagItemArray

{
    if (_subTagItemArray == nil) {
        _subTagItemArray = [NSMutableArray array];
    }
    
    return _subTagItemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"推荐";
    [self loadData];
    
}

#pragma mark - 加载网络数据
- (void)loadData
{
    SYANetWorkTool *netWorkTool = [SYANetWorkTool shareNetWorkTool];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [netWorkTool sya_GET:SYABaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //[responseObject writeToFile:@"/Users/zengqiang/Desktop/Second/Fuck-My-Life/FML/FML/Classes/New(新帖)/Controller/SYASubTagViewController.plist" atomically:YES];
        self.subTagItemArray = [SYASubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //NSLog(@"%@",error);
    }];
    
    
}

#pragma mark - tableView的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return self.subTagItemArray.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//
//}
@end
