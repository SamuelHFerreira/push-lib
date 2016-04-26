//
//  PushAppDelegate.m
//  PushLib
//
//  Created by samuel.ferreira on 04/18/2016.
//  Copyright (c) 2016 samuel.ferreira. All rights reserved.
//

#import "PushAppDelegate.h"
#import "PushLib/PushManager.h"

@implementation PushAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [PushManager sharedInstance:[PushClientData pushClientDataWithBlock:^(PushClientDataBuilder *clientDataBuilder) {
        clientDataBuilder.apnsToken = @"apnstokenTest";
        clientDataBuilder.userId = @"11999950000";
        clientDataBuilder.pushDomainUrl = @"https://realwave.gateway.zup.me/push/v1";
        clientDataBuilder.applicationKey = @"568930a0b9580133a30b021e75abe44c";
    }]];
    [[PushManager sharedInstance] setApnsPushNotificationIdentifier:deviceToken];
}

@end
