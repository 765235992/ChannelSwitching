//
//  AppDelegate.m
//  频道切换
//
//  Created by huaxianwei on 16/5/20.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "AppDelegate.h"
#import "HXWNavigationController.h"
#import "HXWRightRootVC.h"
#import "HXWCenterRootVC.h"
#import "HXWLeftRootVC.h"
#import "MMDrawerController.h"
#import "HXWDrawerVisualStateManager.h"

@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [self.dk_manager dawnComing];

    UIViewController *rightVC =[[HXWRightRootVC alloc]init];
    UINavigationController *rightNavigationVC = [[HXWNavigationController alloc]initWithRootViewController:rightVC];
    [rightNavigationVC setRestorationIdentifier:@"rightNavigationVC"];

    UIViewController *centerVC =[[HXWCenterRootVC alloc] init];
    UINavigationController *centerNavigationVC = [[HXWNavigationController alloc]initWithRootViewController:centerVC];
    [centerNavigationVC setRestorationIdentifier:@"centerNavigationVC"];

    UIViewController *leftVC =[[HXWLeftRootVC alloc] init];
    UINavigationController *leftNavigationVC = [[HXWNavigationController alloc]initWithRootViewController:leftVC];
    [leftNavigationVC setRestorationIdentifier:@"leftNavigationVC"];

    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:centerNavigationVC
                             leftDrawerViewController:leftNavigationVC
                             rightDrawerViewController:rightNavigationVC];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setMaximumLeftDrawerWidth:200.0];

    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[HXWDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
    
    [self.window setRootViewController:self.drawerController];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    self.dk_manager.themeVersion = DKThemeVersionNight;

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
