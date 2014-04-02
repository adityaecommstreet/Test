//
//  MBPostTableViewcellCell.h
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBPostData;

@interface MBPostTableViewcellCell : UITableViewCell

@property (nonatomic,retain)MBPostData *postData;
+ (CGFloat )calculateRowHeight:(MBPostData *)post_temp;

@end
