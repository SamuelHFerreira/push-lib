//
//  ServiceWrap.h
//  PushPlatform
//
//  Created by Samuel Ferreira on 14/03/16.
//  Copyright © 2016 Zup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SWStatusCode) {
    SWHttpStatusConnectionProblem   = 0,
    SWHttpStatusOk                  = 200,
    SWHttpStatusBadRequest          = 400,
    SWHttpStatusUnauthorized        = 401,
    SWHttpStatusForbidden           = 403,
    SWHttpStatusNotFound            = 404,
    SWHttpStatusUnprocessableEntity = 422,
    SWHttpStatusInternalServerError = 500,
    SWHttpStatusServiceUnavailable  = 503
};

@interface ServiceWrap : NSObject

@property (nonatomic) SWStatusCode status;
@property (strong, nonatomic) id raw;
@property (strong, nonatomic) id result;
@property (strong, nonatomic) NSDate *responseDate;

- (instancetype)initWithStatus:(SWStatusCode)status
                      withJson:(id)json
            withClassForResult:(Class)resultClass
                  responseDate:(NSDate*)responseDate;

@end