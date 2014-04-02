//
//  MBDotNetApiClient.m
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#define kBaseUrl @"https://alpha-api.app.net/"

#import "MBDotNetApiClient.h"

#import "AFJSONRequestOperation.h"
@implementation MBDotNetApiClient

+ (MBDotNetApiClient *)sharedClient {
    static  MBDotNetApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MBDotNetApiClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self)
        return nil;
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    self.defaultSSLPinningMode = AFSSLPinningModeNone;
    return self;
}



@end
