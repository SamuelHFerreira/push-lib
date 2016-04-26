//
//  PushClientDataBuilder.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "PushClientDataBuilder.h"
#import <UIKit/UIDevice.h>
#import "PushClientData.h"

static NSString *const DEFAULT_PUSH_API_VERSION = @"1";
static NSString *const PUSH_VERSION_TEMPLATE = @"/push/v{versionNumber}";

@implementation PushClientDataBuilder

-(PushClientData *) build {
    PushClientData *pushClientData = [PushClientData new];
    pushClientData.deviceId = [self getUniqueVendorID];
    pushClientData.baseUrl = [self makeBaseUrl];
    pushClientData.apnsToken = _apnsToken;
    pushClientData.pushAppId = _pushAppId;
    pushClientData.applicationKey = _applicationKey;
    pushClientData.userId = _userId;
    return pushClientData;
}

-(NSString *) getUniqueVendorID {
    NSUUID *oNSUUID = [[UIDevice currentDevice] identifierForVendor];
    return [oNSUUID UUIDString];
}

-(NSString *) makeBaseUrl {
    NSString *pushVersionString = nil;
    if ([_pushAPIVersionNumber isEqualToString:@""]) {
        pushVersionString = [PUSH_VERSION_TEMPLATE stringByReplacingOccurrencesOfString:@"{versionNumber}" withString:DEFAULT_PUSH_API_VERSION];
    }
    else
    {
        pushVersionString = [PUSH_VERSION_TEMPLATE stringByReplacingOccurrencesOfString:@"{versionNumber}" withString:_pushAPIVersionNumber];
    }
    return [_pushDomainUrl stringByAppendingString:pushVersionString];
}

@end