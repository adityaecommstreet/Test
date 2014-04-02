//
//  MBPostData.h
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MBUserData;

@interface MBPostData : NSObject

@property (nonatomic,retain)NSString *sText;
@property (nonatomic,retain)  MBUserData *user;

+ (MBPostData *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
