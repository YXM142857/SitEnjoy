//
//  AppDelegate.m
//  SitEnjoy
//
//  Created by wupei on 2017/5/27.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "AppDelegate.h"
#import "SEMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;

    //设置根控制器
    UINavigationController *rootVC = [[UINavigationController alloc] initWithRootViewController:[[SEMainViewController alloc] init]];
    
    //设置透明
    rootVC.navigationBar.shadowImage = [[UIImage alloc] init];
    [rootVC.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去除 navigationBar 底部的细线
    rootVC.navigationBar.shadowImage = [UIImage new];
    
    [UIApplication sharedApplication].statusBarHidden = YES;

    self.window.rootViewController = rootVC;
    
    [self.window makeKeyWindow];
    
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
