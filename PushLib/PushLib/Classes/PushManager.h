//
//  PushPlatform.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushMessageStatus.h"
#import "PushClientData.h"

@interface PushManager : NSObject

@property (nonatomic, strong) PushClientData *pushClientData;

+ (instancetype) sharedInstance;
+ (instancetype) sharedInstance:(PushClientData *) clientData;

-(NSString*) apnsPushNotificationIdentifier;
-(void) setApnsPushNotificationIdentifier:(NSData*) pushIdentifierData;

-(void) subscribeDevice;
-(void) unSubscribeDevice;
-(void) registerReceivedPushNotification:(NSString*) pushId;
-(void) registerReadPushNotification:(NSString*) pushId;

@end