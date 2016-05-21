//
//  HXWLeftRootVC.m
//  频道切换
//
//  Created by huaxianwei on 16/5/20.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "HXWLeftRootVC.h"

@interface HXWLeftRootVC ()

@end

@implementation HXWLeftRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationController.navigationBarHidden = YES;
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    
    but.frame = CGRectMake(10, 200, 100, 100);
    
    [self.view addSubview:but];
    
    but.backgroundColor = UIColorFromRGB(0x003d79);
    
    [but addTarget:self action:@selector(night) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)night{
    [self.dk_manager dawnComing];
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
