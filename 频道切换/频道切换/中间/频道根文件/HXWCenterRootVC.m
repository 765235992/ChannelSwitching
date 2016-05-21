//
//  HXWCenterRootVC.m
//  频道切换
//
//  Created by huaxianwei on 16/5/20.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "HXWCenterRootVC.h"
#import "MMDrawerBarButtonItem.h"
#import "JHScrollPageView.h"
#import "JHSegmentStyle.h"
#import "HXWRecommendedVC.h"
#import "HXWNewsNormalCell.h"

@interface HXWCenterRootVC ()
{
    JHScrollPageView *scrollPageView;
}
@property (nonatomic, strong) NSMutableArray *currentArr;

@end

@implementation HXWCenterRootVC
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupLeftMenuButton];
    [self setupRightMenuButton];

//    label.dk_textColorPicker =  DKColorPickerWithRGB(0xffffff, 0x343434);
//    self.navigationController.navigationItem.ti.tintColor = [UIColor redColor];
    UIColor * barColor = [UIColor
                          colorWithRed:247.0/255.0
                          green:249.0/255.0
                          blue:250.0/255.0
                          alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:barColor];

    self.title = @"推荐";
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    JHSegmentStyle *style = [[JHSegmentStyle alloc] init];
    //显示遮盖
//    style.showCover = YES;
    // 颜色渐变
//    style.gradualChangeTitleColor = YES;
    // 显示附加的按钮
    style.showExtraButton = YES;
    // 设置附加按钮的背景图片
    style.extraBtnBackgroundImageName = @"extraBtnBackgroundImage";
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    self.currentArr = [[NSMutableArray alloc] initWithArray:childVcs];
    // 初始化
    scrollPageView = [[JHScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, screen_Width, screen_Height -64) segmentStyle:style childVcs:childVcs parentViewController:self];
    scrollPageView.backgroundColor = [UIColor blueColor];
    // 额外的按钮响应的block
    __weak typeof(self) weakSelf = self;
    scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
        weakSelf.title = @"点击了extraBtn";
        HLog(@"点击了extraBtn");
        
        [weakSelf add];
        
    };
    
    scrollPageView.currentTitleInfo = ^(UILabel *label, NSInteger index){
        
        weakSelf.navigationItem.title = label.text;
        
    };
    
    
    [self.view addSubview:scrollPageView];

    self.view.dk_backgroundColorPicker =DKColorPickerWithRGB(0x003d79, 0xff8040, 111111);

}

- (void)add{
//    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    
//    self.navigationController.navigationBar.dk_tintColorPicker =DKColorPickerWithRGB(0xffffff, 0x343434);

//    [scrollPageView setSelectedIndex:2 animated:YES];
}
- (NSArray *)setupChildVcAndTitle {
    
    HXWRecommendedVC *recommendedVC = [[HXWRecommendedVC alloc] initWithNibName:nil bundle:nil];
    recommendedVC.title = @"推荐";
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.title = @"商业头条";
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.title = @"热点事件";
    
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor brownColor];
    vc4.title = @"新一线";
    
    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor lightGrayColor];
    vc5.title = @"周围Surrounding";
    
    UIViewController *vc6 = [UIViewController new];
    vc6.view.backgroundColor = [UIColor orangeColor];
    vc6.title = @"金字招牌";
    
    UIViewController *vc7 = [UIViewController new];
    vc7.view.backgroundColor = [UIColor cyanColor];
    vc7.title = @"Points观点";
    
    UIViewController *vc8 = [UIViewController new];
    vc8.view.backgroundColor = [UIColor blueColor];
    vc8.title = @"Business+";
    
    UIViewController *vc9 = [UIViewController new];
    vc9.view.backgroundColor = [UIColor purpleColor];
    vc9.title = @"封面故事";
    
    UIViewController *vc10 = [UIViewController new];
    vc10.view.backgroundColor = [UIColor magentaColor];
    vc10.title = @"大公司";
    
    UIViewController *vc11 = [UIViewController new];
    vc11.view.backgroundColor = [UIColor whiteColor];
    vc11.title = @"快公司";
    
    UIViewController *vc12 = [UIViewController new];
    vc12.view.backgroundColor = [UIColor redColor];
    vc12.title = @"炫公司";
    
    NSArray *childVcs = [NSArray arrayWithObjects:recommendedVC, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9 , vc10, vc11, vc12, nil];

    return childVcs;
}

-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
//    leftDrawerButton.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
