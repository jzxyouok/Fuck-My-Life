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
#import "SYASubTagCell.h"
#import <SVProgressHUD/SVProgressHUD.h>
@interface SYASubTagViewController ()
@property (nonatomic, strong) NSMutableArray *subTagItemArray;
@property (nonatomic, weak) SYANetWorkTool *tool;
@end

@implementation SYASubTagViewController
static NSString * const ID = @"cell";
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
    [self.tableView registerNib:[UINib nibWithNibName:@"SYASubTagCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.backgroundColor = SYAColor(206, 206, 206);
    
}

- (void)viewWillDisAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
    [SVProgressHUD dismiss];
    // 网速慢的时候快速push pop的时候需要
    [self.tool.tasks makeObjectsPerformSelector:@selector(cancel)];
    
}
#pragma mark - 加载网络数据
- (void)loadData
{
    [SVProgressHUD showWithStatus:@"正在加载数据..."];
    SYANetWorkTool *netWorkTool = [SYANetWorkTool shareNetWorkTool];
    self.tool = netWorkTool;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [netWorkTool sya_GET:SYABaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //[responseObject writeToFile:@"/Users/zengqiang/Desktop/Second/Fuck-My-Life/FML/FML/Classes/New(新帖)/Controller/SYASubTagViewController.plist" atomically:YES];
        self.subTagItemArray = [SYASubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
    
    
}

#pragma mark - tableView的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return self.subTagItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    SYASubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.subTagItem = self.subTagItemArray[indexPath.row];
    return cell;
}

#pragma mark - 返回每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}
@end
