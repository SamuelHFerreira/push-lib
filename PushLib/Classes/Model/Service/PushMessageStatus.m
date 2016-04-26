//
//  PushMessageStatus.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 01/03/16.
//  Copyright © 2016 Vivo. All rights reserved.
//

#import "PushMessageStatus.h"

#define pushMessageStatus @[@"RECEIVED",@"READ"]

@implementation PushMessageStatus


+(NSString*)getMessageStatusForEnum:(PushMessageStatusEnum) messageStatusEnum {
    return pushMessageStatus[messageStatusEnum];
}

@end