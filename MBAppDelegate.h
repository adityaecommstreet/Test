//
//  MBAppDelegate.h
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class MBViewController;
@class MBPostViewController;

@interface MBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic)  UINavigationController *navController;
@property (strong, nonatomic) MBPostViewController *VC_TableData;

@end
