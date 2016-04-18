//
//  PushClientDataBuilder.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushClientData.h"

@interface PushClientDataBuilder : NSObject

-(id) build;

@property (nonatomic, strong) NSString *pushAppId;
@property (nonatomic, strong) NSString *apnsToken;
@property (nonatomic, strong) NSString *pushDomainUrl;
@property (nonatomic, strong) NSString *applicationKey;
@property (nonatomic, strong) NSString *userId;

#pragma optional attributes
@property (nonatomic, strong) NSString *pushAPIVersionNumber;



@end