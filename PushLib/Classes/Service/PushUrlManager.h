//
//  PushUrlManager.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 15/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushUrlManager : NSObject

@property (strong) NSString *baseUrl;

-(instancetype) initWithUrl:(NSString*) urlString;

-(NSString*) pushSubscribeUrlString;
-(NSString*) pushUnSubscribeUrlString:(NSString*) userId;
-(NSString*) pushStatusUrlString;


@end