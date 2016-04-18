//
//  PushMessageStatus.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 01/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PushMessageStatusEnum) {
    PushMessageStatusReceived,
    PushMessageStatusRead
};

@interface PushMessageStatus : NSObject

@property (nonatomic, strong) NSString* status;
@property (nonatomic, strong) NSString* pushMessageId;

+(NSString*)getMessageStatusForEnum:(PushMessageStatusEnum) messageStatusEnum;

@end