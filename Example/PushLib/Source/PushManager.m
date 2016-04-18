//
//  PushPlatform.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "PushManager.h"
#import "NSData+Hex.h"
#import "PushService.h"
#import "OCMapper.h"
#import "PushSubscription.h"
#import "PushUrlManager.h"
#import "PushClientData.h"

#define APNS_PUSH_NOTIFICATION_USERDEFAULTS_KEY @"APNS_PUSH_NOTIFICATION_USERDEFAULTS_KEY"
#define SENDING_PLATFORM @"IOS"

static dispatch_once_t onceToken;

@interface PushManager ()

@property (nonatomic, strong) PushService *pushService;

@end

@implementation PushManager

+ (instancetype) sharedInstance:(PushClientData *) clientData {
    static PushManager *__sharedInstance;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[PushManager alloc] initWithClientData:clientData];
    });
    return __sharedInstance;
}

+ (instancetype) sharedInstance {
    static PushManager *__sharedInstance;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [PushManager new];
    });
    return __sharedInstance;
}

- (instancetype) initWithClientData:(PushClientData *) clientData  {
    self = [super init];
    PushUrlManager *urlManager =[[PushUrlManager alloc] initWithUrl:clientData.baseUrl];
    _pushService = [[PushService alloc] initWithManager:urlManager];
    _pushClientData = clientData;
    return self;
}

-(void) setApnsPushNotificationIdentifier:(NSData*)pushIdentifierData {
    if(pushIdentifierData.length > 0)
    {
        NSString *pushIdentifier = [pushIdentifierData hexString];
        if(pushIdentifier)
        {
            [[NSUserDefaults standardUserDefaults] setObject:pushIdentifier forKey:APNS_PUSH_NOTIFICATION_USERDEFAULTS_KEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

-(NSString*) apnsPushNotificationIdentifier {
    NSString *pushIdentifier = [[NSUserDefaults standardUserDefaults] stringForKey:APNS_PUSH_NOTIFICATION_USERDEFAULTS_KEY];
    return pushIdentifier.length > 0 ? pushIdentifier : @"PUSH_NOT_AVAILABLE";
}

-(void) subscribeDevice {
    PushSubscription *pushSubscription = [PushSubscription new];
    pushSubscription.appId = _pushClientData.pushAppId;
    pushSubscription.platform = SENDING_PLATFORM;
    pushSubscription.token = [self apnsPushNotificationIdentifier];
    pushSubscription.deviceId = _pushClientData.deviceId;
    pushSubscription.userId = _pushClientData.userId;
    
    [_pushService subscribe:pushSubscription success:^(void) {
        NSLog(@"subscribe with success");
    } failure:^(ServiceWrap *wrap) {
        NSLog(@"subscribe with failure");
    }];
}

-(void) unSubscribeDevice {
    PushSubscription *pushSubscription = [PushSubscription new];
    pushSubscription.appId = _pushClientData.pushAppId;
    pushSubscription.platform = SENDING_PLATFORM;
    pushSubscription.deviceId = _pushClientData.deviceId;
    pushSubscription.userId = _pushClientData.userId;
    
    [_pushService unSubscribe:pushSubscription success:^(void) {
        NSLog(@"subscribe with success");
    } failure:^(ServiceWrap *wrap) {
        NSLog(@"subscribe with failure");
    }];
}

-(void) registerReadPushNotification:(NSString*) pushId {
    [self registerStatusPushNotification:pushId withStatus:PushMessageStatusRead];
}

-(void) registerReceivedPushNotification:(NSString*) pushId {
    [self registerStatusPushNotification:pushId withStatus:PushMessageStatusReceived];
}

-(void) registerStatusPushNotification:(NSString*) pushId withStatus:(PushMessageStatusEnum) status {
    PushMessageStatus *pushMessageStatus = [PushMessageStatus new];
    pushMessageStatus.status = [PushMessageStatus getMessageStatusForEnum:status];
    pushMessageStatus.pushMessageId = pushId;

    [_pushService statusUpdateWithMessageStatus:pushMessageStatus success:^(void) {
        NSLog(@"PushMessage status update with success");
    } failure:^(ServiceWrap *wrap) {
        NSLog(@"PushMessage status update with failure");
    }];
}

@end