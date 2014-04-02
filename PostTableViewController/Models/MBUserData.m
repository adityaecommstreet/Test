//
//  MBUserData.m
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import "MBUserData.h"

@implementation MBUserData
@synthesize sAvatarImage ;
@synthesize sUserName ;
@synthesize userId ;

+ (MBUserData *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    MBUserData *instance = [[[MBUserData alloc] init] autorelease];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
    
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.sUserName = [aDictionary objectForKey:@"username"];
    self.sAvatarImage = [aDictionary valueForKeyPath:@"avatar_image.url"];
}


- (void)dealloc
{
    //[_sAvatarImage release];
    //[_sUserName release];
    [super dealloc];
}

@end
