//
//  JHChannelVC.m
//  频道切换
//
//  Created by 滑现伟 on 16/5/17.
//  Copyright © 2016年 Aubrey. All rights reserved.
//

#import "JHChannelVC.h"
#import "JHScrollPageView.h"
#import "JHSegmentStyle.h"
#import "TestVC.h"

@interface JHChannelVC ()
{
    JHScrollPageView *scrollPageView;
}
@property (nonatomic, strong) NSMutableArray *currentArr;
@end

@implementation JHChannelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"效果示例";
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    JHSegmentStyle *style = [[JHSegmentStyle alloc] init];
    //显示遮盖
    style.showCover = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    // 显示附加的按钮
    style.showExtraButton = YES;
    // 设置附加按钮的背景图片
    style.extraBtnBackgroundImageName = @"extraBtnBackgroundImage";
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    NSLog(@"%@",childVcs);
    self.currentArr = [[NSMutableArray alloc] initWithArray:childVcs];
    // 初始化
    scrollPageView = [[JHScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height ) segmentStyle:style childVcs:childVcs parentViewController:self];
    // 额外的按钮响应的block
    __weak typeof(self) weakSelf = self;
    scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
        weakSelf.title = @"点击了extraBtn";
        NSLog(@"点击了extraBtn");
        [weakSelf add];
    };
    [self.view addSubview:scrollPageView];
}
- (void)add{
    TestVC *vc1 = [[TestVC alloc] init];
    
//    Class vc1 = [TestVC class];
    vc1.view.backgroundColor = [UIColor grayColor];
    vc1.title = @"111头条";
    [_currentArr  insertObject:vc1 atIndex:2];
    [scrollPageView reloadChildVcsWithNewChildVcs:_currentArr];
    
}
- (NSArray *)setupChildVcAndTitle {
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.title = @"新闻头条";
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.title = @"国际要闻";
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.title = @"体育";
    
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor brownColor];
    vc4.title = @"中国足球";
    
    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor lightGrayColor];
    vc5.title = @"汽车";
    
    UIViewController *vc6 = [UIViewController new];
    vc6.view.backgroundColor = [UIColor orangeColor];
    vc6.title = @"囧途旅游";
    
    UIViewController *vc7 = [UIViewController new];
    vc7.view.backgroundColor = [UIColor cyanColor];
    vc7.title = @"幽默搞笑";
    
    UIViewController *vc8 = [UIViewController new];
    vc8.view.backgroundColor = [UIColor blueColor];
    vc8.title = @"视频";
    
    UIViewController *vc9 = [UIViewController new];
    vc9.view.backgroundColor = [UIColor purpleColor];
    vc9.title = @"无厘头";
    
    UIViewController *vc10 = [UIViewController new];
    vc10.view.backgroundColor = [UIColor magentaColor];
    vc10.title = @"美女图片";
    
    UIViewController *vc11 = [UIViewController new];
    vc11.view.backgroundColor = [UIColor whiteColor];
    vc11.title = @"今日房价";
    
    UIViewController *vc12 = [UIViewController new];
    vc12.view.backgroundColor = [UIColor redColor];
    vc12.title = @"头像";
    
    NSArray *childVcs = [NSArray arrayWithObjects:vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9 , vc10, vc11, vc12, nil];
    NSLog(@"%@",childVcs);
    return childVcs;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)allChildVcs
{
    
}
@end
