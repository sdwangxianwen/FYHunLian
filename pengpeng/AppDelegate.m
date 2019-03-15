//
//  AppDelegate.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "AppDelegate.h"
#import "PPLoginViewController.h" //登录
#import <IQKeyboardManager.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    // 解决tabBar pop回来闪的问题
    [[UITabBar appearance] setTranslucent:NO];
    if ([PPUser readUserID] && [PPUser readInputInfo]) {
        PPTabBarController *tab = [[PPTabBarController alloc] init];
        self.window.rootViewController = tab;
    } else {
        PPLoginViewController *loginVC = [[PPLoginViewController alloc] init];
        PPNavigationController *nav = [[PPNavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = nav;
    }
   
 
    [self.window makeKeyAndVisible];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    //键盘设置
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
