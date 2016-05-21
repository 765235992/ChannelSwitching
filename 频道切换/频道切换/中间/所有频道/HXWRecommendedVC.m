//
//  HXWRecommendedVC.m
//  频道切换
//
//  Created by huaxianwei on 16/5/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "HXWRecommendedVC.h"
#import "HXWNewsNormalCell.h"
#import "UIView+MJExtension.h"
#import "MJRefresh.h"
#import "MJRefreshGifHeader.h"
#import "HXWRefreshHeader.h"
static const CGFloat MJDuration = 2.0;

#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface HXWRecommendedVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *aTableView;

@end

@implementation HXWRecommendedVC
- (void)dealloc
{
    HLog(@"释放");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _aTableView.dk_backgroundColorPicker = DKColorPickerWithKey(频道控制器背景颜色);
    // 下拉刷新
    self.aTableView.mj_header = [HXWRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.aTableView.mj_header beginRefreshing];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    _aTableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    _aTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [_aTableView.mj_footer endRefreshing];
        });
    }];

    HLog(@"%@",_aTableView);
}
#pragma mark - 数据处理相关
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        [self.data insertObject:MJRandomData atIndex:0];
//    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
//        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.aTableView.mj_header endRefreshing];
    });
}

#pragma mark UITableViewDataSource,UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    
    HXWNewsNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HXWNewsNormalCell" owner:self options:nil] firstObject];
        
        cell.backgroundColor = [UIColor redColor];
    }
    cell.test = 1;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}

@end
