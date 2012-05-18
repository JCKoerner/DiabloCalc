//
//  AppDelegate.m
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize rootNavigationController = _rootNavigationController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.rootNavigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [self.rootNavigationController setNavigationBarHidden:YES animated:NO];
    //[[self.rootNavigationController navigationBar] setTintColor:[UIColor blackColor]];
    [[self.rootNavigationController navigationBar] setBarStyle:UIBarStyleBlackTranslucent];
    
    
   [self customizeAppearance];
    self.window.rootViewController = self.rootNavigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)customizeAppearance {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) {
        //iOS 5
        //[self.tabBarController.tabBar insertSubview:imageView atIndex:1];
               
        //[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tab_select_indicator"]]; 
        
        UIImage *navBackground = [[UIImage imageNamed:@"Navbar"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
        [[UINavigationBar appearance] setBackgroundImage:navBackground forBarMetrics:UIBarMetricsDefault];
        
        
        
//        [[UINavigationBar appearance] setTitleTextAttributes:
//         [NSDictionary dictionaryWithObjectsAndKeys:
//          [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.9], 
//          UITextAttributeTextColor, 
//          [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], 
//          UITextAttributeTextShadowColor, 
//          [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
//          UITextAttributeTextShadowOffset, 
//          [UIFont fontWithName:@"Arial-Bold" size:0.0], 
//          UITextAttributeFont, 
//          nil]];
        
        //UIImage *backButton = [[UIImage imageNamed:@"back_button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14.0, 0, 6.0)];
      //  [[UIBarButtonItem appearance] setBackgroundImage:backButton forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
      //  [self.tabBarController.tabBar setSelectedImageTintColor:[UIColor colorWithRed:.35 green:.48 blue:.82 alpha:1]];
       // UIImage *indicatorImage = [[UIImage imageNamed:@"TabBarSelection"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 4, 4, 4)];
        // UIImage *indicatorImage = [[UIImage imageNamed:@"tabbar_temp"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 4, 0, 4)];
        //[[UITabBar appearance] setSelectionIndicatorImage:indicatorImage];
        
    }
    
}

@end
