//
//  PushUrlManager.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "PushUrlManager.h"

static NSString *const SUBSCRIBE_FOR_PUSH_URL = @"/subscriptions";
static NSString *const UNSUBSCRIBE_FOR_PUSH_URL = @"/subscriptions/{userId}";
static NSString *const PUSH_STATUS_URL = @"/status";

@interface PushUrlManager ()

@property (strong) NSString *baseUrl;

@end

@implementation PushUrlManager

-(instancetype) initWithUrl:(NSString*) urlString {
    self = [super init];
    if (!self) {
        return nil;
    }
    _baseUrl = urlString;
    return self;
}

-(NSString*) addPushSuffixToUrlString:(NSString*)urlString {
    return [NSString stringWithFormat:@"%@%@", _baseUrl, urlString];
}

-(NSString*) pushSubscribeUrlString {
    return [self addPushSuffixToUrlString:SUBSCRIBE_FOR_PUSH_URL];
}

-(NSString*) pushUnSubscribeUrlString:(NSString*) userId {
    return [self addPushSuffixToUrlString:[UNSUBSCRIBE_FOR_PUSH_URL stringByReplacingOccurrencesOfString:@"{userId}" withString:userId]];
}

-(NSString*) pushStatusUrlString {
    return [self addPushSuffixToUrlString:PUSH_STATUS_URL];
}

@end