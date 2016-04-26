//  ServicesApiClient.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "AFSecurityPolicy.h"
#import "AFNetworkReachabilityManager.h"

#import "AFURLConnectionOperation.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

#import "ServiceWrap.h"

FOUNDATION_EXTERN NSString *const kNoRequestLeftNotification;
FOUNDATION_EXTERN NSString *const kAppKeyForbiddenNotification;

@interface ServicesApiClient : AFHTTPRequestOperationManager

@property (strong) NSDateFormatter *responseDateHeaderDateFormatter;

+ (instancetype)sharedClient;
+ (void) refreshInstance;

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                    resultClass:(Class)resultClass
                        success:(void(^)(ServiceWrap *wrap))success
                        failure:(void(^)(ServiceWrap *wrap))failure
                     completion:(void(^)(void))completion;

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
                     resultClass:(Class)resultClass
                         success:(void(^)(ServiceWrap *wrap))success
                         failure:(void(^)(ServiceWrap *wrap))failure
                      completion:(void(^)(void))completion;

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     parameters:(id)parameters
                    resultClass:(Class)resultClass
                        success:(void(^)(ServiceWrap *wrap))success
                        failure:(void(^)(ServiceWrap *wrap))failure
                     completion:(void(^)(void))completion;

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                        parameters:(id)parameters
                       resultClass:(Class)resultClass
                           success:(void(^)(ServiceWrap *wrap))success
                           failure:(void(^)(ServiceWrap *wrap))failure
                        completion:(void(^)(void))completion;


@end
