//
//  ServicesApiClient.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "ServicesApiClient.h"
#import "AFURLResponseSerialization.h"
#import "AFURLRequestSerialization.h"
#import "AFNetworkReachabilityManager.h"
#import "PushManager.h"

NSString *const kNoRequestLeftNotification = @"NoRequestLeftNotification";
NSString *const kAppKeyForbiddenNotification = @"AppKeyForbiddenNotification";

static NSString *const kApplicationKey = @"cea3b5f0c79a0133a3f9021e75abe44c";

static dispatch_once_t onceToken;

@interface ServicesApiClient ()

@property (nonatomic, strong) NSString *nextRequestToken;

@end

@implementation ServicesApiClient

+(NSString*)getServicesBaseURLString
{
    NSString *urlString = [PushManager sharedInstance].pushClientData.baseUrl;
    NSLog(@"baseURL = %@", urlString);
    return urlString;
}

+ (instancetype)sharedClient
{
    static ServicesApiClient *__sharedInstance;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:[self getServicesBaseURLString]];
        __sharedInstance = [[ServicesApiClient alloc] initWithBaseURL:baseUrl];
        __sharedInstance.requestSerializer = [AFJSONRequestSerializer new];
        [__sharedInstance.requestSerializer setValue:@"application/json, image/jpeg" forHTTPHeaderField:@"Accept"];
        [__sharedInstance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [__sharedInstance.requestSerializer setValue:kApplicationKey forHTTPHeaderField:@"X-Application-Key"];
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer new];
        responseSerializer.readingOptions = NSJSONReadingAllowFragments;
        __sharedInstance.responseSerializer = responseSerializer;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
        [__sharedInstance setResponseDateHeaderDateFormatter:dateFormatter];
    });
    
    return __sharedInstance;
}

+(void) refreshInstance
{
    onceToken = 0;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    return self;
}

#pragma  mark - HTTP methods

-(NSDate*)responseDateFromOperation:(AFHTTPRequestOperation*) operation
{
    NSString* dateAsString = [[operation.response allHeaderFields] objectForKey:@"Response-Date"];
    if(dateAsString)
    {
        return [[self responseDateHeaderDateFormatter] dateFromString:dateAsString];
    }
    return nil;
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                    resultClass:(Class)resultClass
                        success:(void(^)(ServiceWrap *wrap))success
                        failure:(void(^)(ServiceWrap *wrap))failure
                     completion:(void(^)(void))completion
{
    NSLog(@"GET `%@`", URLString);
    return [self GET:URLString parameters:parameters
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:SWHttpStatusOk
                                                                withJson:responseObject
                                                      withClassForResult:resultClass
                                                            responseDate:[self responseDateFromOperation:operation]];
                 if (success) { success(wrap); }
                 [self notifyNoRequestLeftAndCallCompletionBlock:completion];
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"[error] %@: %@", error.domain, error.localizedDescription);
                 
                 NSUInteger status = operation.response.statusCode;
                 id responseObject = operation.responseObject;
                 
                 if (status == SWHttpStatusForbidden) {
                     [[NSNotificationCenter defaultCenter] postNotificationName:kAppKeyForbiddenNotification object:nil];
                 } else {
                     ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:status
                                                                    withJson:responseObject
                                                          withClassForResult:resultClass
                                                                responseDate:[self responseDateFromOperation:operation]];
                     if (failure) { failure(wrap); }
                     [self notifyNoRequestLeftAndCallCompletionBlock:completion];
                 }
             }
            ];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
                     resultClass:(Class)resultClass
                         success:(void(^)(ServiceWrap *wrap))success
                         failure:(void(^)(ServiceWrap *wrap))failure
                      completion:(void(^)(void))completion
{
    NSLog(@"POST `%@` `%@` %@", self.baseURL, URLString, parameters);
    return [self POST:URLString parameters:parameters
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:SWHttpStatusOk
                                                                 withJson:responseObject
                                                       withClassForResult:resultClass
                                                             responseDate:[self responseDateFromOperation:operation]];
                  if (success) { success(wrap); }
                  [self notifyNoRequestLeftAndCallCompletionBlock:completion];
              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"[error] %@: %@", error.domain, error.localizedDescription);
                  
                  NSUInteger status = operation.response.statusCode;
                  id responseObject = operation.responseObject;
                  
                  if (status == SWHttpStatusForbidden) {
                      [[NSNotificationCenter defaultCenter] postNotificationName:kAppKeyForbiddenNotification object:nil];
                      
                  } else {
                      ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:status
                                                                     withJson:responseObject
                                                           withClassForResult:resultClass
                                                                 responseDate:[self responseDateFromOperation:operation]];
                      if (failure) { failure(wrap); }
                      [self notifyNoRequestLeftAndCallCompletionBlock:completion];
                  }
              }
            ];
}

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     parameters:(id)parameters
                    resultClass:(Class)resultClass
                        success:(void(^)(ServiceWrap *wrap))success
                        failure:(void(^)(ServiceWrap *wrap))failure
                     completion:(void(^)(void))completion
{
    NSLog(@"PUT `%@` %@", URLString, parameters);
    return [self PUT:URLString parameters:parameters
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:SWHttpStatusOk
                                                                withJson:responseObject
                                                      withClassForResult:resultClass
                                                            responseDate:[self responseDateFromOperation:operation]];
                 if (success) { success(wrap); }
                 [self notifyNoRequestLeftAndCallCompletionBlock:completion];
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"[error] %@: %@", error.domain, error.localizedDescription);
                 
                 NSUInteger status = operation.response.statusCode;
                 id responseObject = operation.responseObject;
                 
                 if (status == SWHttpStatusForbidden) {
                     [[NSNotificationCenter defaultCenter] postNotificationName:kAppKeyForbiddenNotification object:nil];
                 } else {
                     ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:status
                                                                    withJson:responseObject
                                                          withClassForResult:resultClass
                                                                responseDate:[self responseDateFromOperation:operation]];
                     if (failure) { failure(wrap); }
                     [self notifyNoRequestLeftAndCallCompletionBlock:completion];
                 }
             }
            ];
}

- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString
                        parameters:(id)parameters
                       resultClass:(Class)resultClass
                           success:(void(^)(ServiceWrap *wrap))success
                           failure:(void(^)(ServiceWrap *wrap))failure
                        completion:(void(^)(void))completion
{
    NSLog(@"DELETE `%@` %@", URLString, parameters);
    return [self DELETE:URLString parameters:parameters
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:SWHttpStatusOk
                                                                   withJson:responseObject
                                                         withClassForResult:resultClass
                                                               responseDate:[self responseDateFromOperation:operation]];
                    if (success) { success(wrap); }
                    [self notifyNoRequestLeftAndCallCompletionBlock:completion];
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"[error] %@: %@", error.domain, error.localizedDescription);
                    
                    NSUInteger status = operation.response.statusCode;
                    id responseObject = operation.responseObject;
                    
                    if (status == SWHttpStatusForbidden) {
                        [[NSNotificationCenter defaultCenter] postNotificationName:kAppKeyForbiddenNotification object:nil];
                    } else {
                        ServiceWrap *wrap = [[ServiceWrap alloc] initWithStatus:status
                                                                       withJson:responseObject
                                                             withClassForResult:resultClass
                                                                   responseDate:[self responseDateFromOperation:operation]];
                        if (failure) { failure(wrap); }
                        [self notifyNoRequestLeftAndCallCompletionBlock:completion];
                    }
                }
            ];
}

#pragma mark Notify that has no request left on queue

-(void)notifyNoRequestLeftAndCallCompletionBlock:(void(^)(void))completion
{
    [self notifyNoRequestLeft];
    if (completion) { completion(); }
}

-(void)notifyNoRequestLeft
{
    if(self.operationQueue.operationCount == 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNoRequestLeftNotification object:nil];
    }
}

@end