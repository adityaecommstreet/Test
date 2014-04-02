//
//  MBUserData.h
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBUserData : NSObject

@property (nonatomic,retain) NSString *sUserName;
@property (nonatomic,readonly) NSUInteger userId;
@property (nonatomic,retain) NSString *sAvatarImage;

+ (MBUserData *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
