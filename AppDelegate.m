//
//  AppDelegate.m
//  cryh
//
//  Created by Junze on 16/5/6.
//  Copyright © 2016年 Zhouyijin. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "SecondViewController.h"
#import "ViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic,strong)Reachability *reach;
@property (nonatomic,strong)UITabBarController *tabBar;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [application setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
    
    self.reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    [self.reach startNotifier];
    self.tabBar = [self createTabBar];
    self.tabBar.delegate = self;
    self.window.rootViewController = self.tabBar;
    [self configNavigationbarAndTabbar];
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)noti
{
    Reachability *reach = [noti object];
    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus= [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        NSLog(@"没有网络");
    }
    else if (netStatus == ReachableViaWiFi)
    {
        NSLog(@"wifi");
    }
    else if (netStatus == ReachableViaWWAN)
    {
        NSLog(@"wwan");
    }
    
}

- (void)configNavigationbarAndTabbar
{
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName ,nil] forState:UIControlStateSelected];
    
    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]
//                                       forBarMetrics:UIBarMetricsDefault];

}

- (UITabBarController *)createTabBar
{
    UITabBarController *tab = [[UITabBarController alloc] init];
    //1
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *home = [story instantiateViewControllerWithIdentifier:@"homeVC"];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:home];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"1"] tag:1];
    home.tabBarItem = item1;
    
    //2
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    
     UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"二页" image:[UIImage imageNamed:@"2"] tag:2];
    second.tabBarItem  = item2;
    
    tab.viewControllers =  @[nav1,nav2];
    return tab;
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

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    
}

#pragma mark - uitabbarcontroller delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([tabBarController.viewControllers indexOfObject:viewController] == 0) {
        NSLog(@"首页");
    }
    else
    {
        NSLog(@"次页");
    }
}
@end
