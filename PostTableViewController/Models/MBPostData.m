//
//  MBPostData.m
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import "MBPostData.h"
#import "MBUserData.h"
@implementation MBPostData

@synthesize sText ;
@synthesize user ;
+ (MBPostData *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    MBPostData *instance = [[[MBPostData alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
    
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.sText = [aDictionary objectForKey:@"text"];
   self.user = [MBUserData instanceFromDictionary:[aDictionary valueForKey:@"user"]];
    
}


-(void)dealloc
{
    //[_sText release];
    [super dealloc];
}
@end
