//
//  ServiceWrap.m
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import "ServiceWrap.h"
#import "NSObject+ObjectMapper.h"
#import "OCMapper.h"

@implementation ServiceWrap

- (instancetype)initWithStatus:(SWStatusCode)status
                      withJson:(id)json
            withClassForResult:(Class)resultClass
                  responseDate:(NSDate*)responseDate
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _raw = json;
    _status = status;
    _result = [self resultFromJson:json withClass:resultClass];
    _responseDate = responseDate ? responseDate : [NSDate date];
    NSLog(@"responseDate = %@", responseDate);
    NSLog(@"withJson = %@", json);
    return self;
}

- (id)resultFromJson:(id)json withClass:(Class)resultClass
{
    if ([json isKindOfClass:[NSArray class]]) {
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:[json count]];
        for (id item in json)
        {
            id object = [self resultFromJson:item withClass:resultClass];
            if (object) [result addObject:object];
        }
        return result;
    }
    else if([json isKindOfClass:resultClass])
    {
        return json;
    }
    else if ([json isKindOfClass:[NSDictionary class]]) {
        return [resultClass objectFromDictionary:json];
    }
    else {
        if(self.status == SWHttpStatusUnprocessableEntity)
        {
            return json;
        }
        return [json isKindOfClass:resultClass] ? json : nil;
    }
}

@end