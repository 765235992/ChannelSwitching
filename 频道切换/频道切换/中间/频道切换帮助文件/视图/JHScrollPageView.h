//
//  JHScrollPageView.h
//  频道切换
//
//  Created by 滑现伟 on 16/5/17.
//  Copyright © 2016年 Aubrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHScrollSegmentView.h"
#import "JHContentView.h"
typedef void(^ExtraBtnOnClick)(UIButton *extraBtn);
typedef void(^TitleOnClick)(NSString *title);

@interface JHScrollPageView : UIView
@property (copy, nonatomic) ExtraBtnOnClick extraBtnOnClick;
@property (copy, nonatomic) TitleOnClick titleOnClick;

- (instancetype)initWithFrame:(CGRect)frame segmentStyle:(JHSegmentStyle *)segmentStyle childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController;

/*
 * 给外界设置选中的下标的方法
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;
/*
 *  给外界重新设置视图内容的标题的方法
 */
- (void)reloadChildVcsWithNewChildVcs:(NSArray *)newChildVcs;

@end
