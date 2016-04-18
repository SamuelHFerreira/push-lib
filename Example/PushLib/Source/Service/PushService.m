//
//  PushService.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "PushService.h"
#import "ServiceWrap.h"
#import "ServicesApiClient.h"
#import "PushSubscription.h"
#import "PushMessageStatus.h"
#import "OCMapper.h"
#import "PushUrlManager.h"
#import "SubscriptionResult.h"

@implementation PushService

-(instancetype)initWithManager:(PushUrlManager *) urlManager {
    self = [super init];
    if (!self) {
        return nil;
    }
    _urlManager = urlManager;
    return self;
}

-(void)subscribe:(PushSubscription*) pushSubscription success:(void (^)())success failure:(void (^)(ServiceWrap *wrap)) failure {
    [[ServicesApiClient sharedClient] POST:[_urlManager pushSubscribeUrlString] parameters:[pushSubscription dictionary] resultClass:SubscriptionResult.class success:^(ServiceWrap *wrap) {
        success();
    } failure:^(ServiceWrap *wrap) {
        failure(wrap);
    } completion:^{
    }];
}

-(void)unSubscribe:(PushSubscription*) pushSubscription success:(void (^)()) success failure:(void (^)(ServiceWrap *wrap)) failure {
    NSDictionary *params = [[NSDictionary alloc] initWithDictionary:[pushSubscription dictionary]];
    [[ServicesApiClient sharedClient] DELETE:[_urlManager pushUnSubscribeUrlString:pushSubscription.userId] parameters:params resultClass:SubscriptionResult.class success:^(ServiceWrap *wrap) {
        success();
    } failure:^(ServiceWrap *wrap) {
        failure(wrap);
    } completion:^{
    }];
}

-(void) statusUpdateWithMessageStatus:(PushMessageStatus*) pushMessageStatus success:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure {
    [[ServicesApiClient sharedClient] PUT:[_urlManager pushStatusUrlString] parameters:[pushMessageStatus dictionary] resultClass:SubscriptionResult.class success:^(ServiceWrap *wrap) {
        success();
    } failure:^(ServiceWrap *wrap) {
        failure(wrap);
    } completion:^{
    }];
}

//-(NSArray*) listOfflineMessages:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure {
//    return nil;
//}

@end