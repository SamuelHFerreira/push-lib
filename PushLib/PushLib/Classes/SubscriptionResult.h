//
//  PushMessageStatusError.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 01/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PushMessageStatusErrorEnum) {
    PushMessageErrorObjectNotFound,
    PushMessageErrorPushException,
    PushMessageErrorPushDeliveryException,
    PushMessageErrorPushInvalidTokenException,
    PushMessageErrorPushInvalidApiKeyException,
    PushMessageErrorPushInvalidCertificateException,
    PushMessageErrorUnsuportedPlatformException,
    PushMessageErrorRequiredField,
    PushMessageErrorTokenNotFound,
    PushMessageErrorCertificateNotFound
};

@interface SubscriptionResult : NSObject

@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) NSString *field;

@end