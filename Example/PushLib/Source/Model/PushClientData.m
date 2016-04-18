//
//  PushClientData.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "PushClientData.h"
#import "PushClientDataBuilder.h"

@implementation PushClientData

+ (instancetype)pushClientDataWithBlock:(ClientDataBlock) block {
    NSParameterAssert(block);
    
    PushClientDataBuilder *builder = [PushClientDataBuilder new];
    block(builder);
    return [builder build];
}

@end