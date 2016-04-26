//
//  PushClientData.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushClientDataBuilder.h"

@class PushClientDataBuilder;
typedef void(^ClientDataBlock)(PushClientDataBuilder *pushClientDataBuilder);

@interface PushClientData : NSObject

@property (nonatomic, strong) NSString *pushAppId;
@property (nonatomic, strong) NSString *apnsToken;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *deviceId;
@property (nonatomic, strong) NSString *applicationKey;

+ (instancetype)pushClientDataWithBlock:(ClientDataBlock) block;

@end