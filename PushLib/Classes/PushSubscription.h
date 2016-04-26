//
//  PushSubscription.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 01/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushSubscription : NSObject

@property (strong) NSString *appId;
@property (strong) NSString *platform;
@property (strong) NSString *token;
@property (strong) NSString *deviceId;
@property (strong) NSString *userId;

@end