//
//  PushService.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "ServiceWrap.h"
#import "PushSubscription.h"
#import "PushMessageStatus.h"
#import "PushUrlManager.h"

@interface PushService : NSObject

@property (nonatomic, strong) PushUrlManager *urlManager;
-(instancetype)initWithManager:(PushUrlManager *) urlManager;

-(void) subscribe:(PushSubscription*)pushSubscription success:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure;
-(void) unSubscribe:(PushSubscription*)pushSubscription success:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure;
-(void) statusUpdateWithMessageStatus:(PushMessageStatus*) pushMessageStatus success:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure;
//-(NSArray*) listOfflineMessages:(void (^)())success failure:(void (^)(ServiceWrap *wrap))failure;

@end