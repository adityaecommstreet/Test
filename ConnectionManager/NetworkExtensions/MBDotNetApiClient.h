//
//  MBDotNetApiClient.h
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface MBDotNetApiClient : AFHTTPClient

+ (MBDotNetApiClient *)sharedClient;

@end
