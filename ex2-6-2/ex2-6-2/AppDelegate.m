//
//  AppDelegate.m
//  ex2-6-2
//
//  Created by ryota on 2017/07/29.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()
@property NSMutableDictionary *queryDictionary;
@property (strong, nonatomic) ViewController *viewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    // &で区切る
    NSString *urlStr = [NSString stringWithFormat:@"%@",url];
    NSLog(@"%@",urlStr);
    NSArray* queryList1 = [urlStr componentsSeparatedByString: @"neec2://"];
    NSLog(@"%@",queryList1);
    
    NSArray* queryList = [queryList1[1] componentsSeparatedByString: @"&"];
    if(!queryList){
        // error
        return NO;
    }
    NSLog(@"%@",queryList);
    NSMutableDictionary* queryDictionary = [NSMutableDictionary dictionary];
    // リスト分ループ
    for(NSString* query in queryList){
        // xx=yyyyとなっているので、=で区切ってdictionary化
        NSArray* dictList = [query componentsSeparatedByString: @"="];
        [queryDictionary setObject: [dictList lastObject] forKey: [dictList objectAtIndex: 0]];
    }
    if([[queryDictionary allKeys] containsObject:@"caption"]){
        _viewController.caption.text = [queryDictionary objectForKey:@"caption"];
        NSLog(@"%@",[queryDictionary objectForKey:@"caption"]);
    }else{
        _viewController.caption.text = @"";
    }
    if([[queryDictionary allKeys] containsObject:@"comment"]){
        _viewController.comment.text = [queryDictionary objectForKey:@"comment"];
    }else{
        _viewController.comment.text = @"";
    }

    
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
