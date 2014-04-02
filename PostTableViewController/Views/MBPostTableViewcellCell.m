//
//  MBPostTableViewcellCell.m
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import "MBPostTableViewcellCell.h"
#import "MBPostData.h"
#import "MBUserData.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>
@implementation MBPostTableViewcellCell
{
    MBPostData *post;
}
@synthesize postData = _postData;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.detailTextLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor lightGrayColor];
        [self.detailTextLabel setFont:[UIFont systemFontOfSize:12.0f]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.imageView setImage:[UIImage imageNamed:@"Default.png"]];
        //self.imageView.backgroundColor = [UIColor blackColor] ;
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPostData:(MBPostData *)postData
{
    //[self setFrameOfUIComponents];

    post = postData;
    [self.textLabel setText:post.user.sUserName];
    [self.detailTextLabel setText:post.sText];
    //[self.imageView setImageWithURL:[NSURL URLWithString:post.user.sAvatarImage]];
    [self.imageView setImageWithURL:[NSURL URLWithString:post.user.sAvatarImage] placeholderImage:[UIImage imageNamed:@"default.png"]];
    [self setNeedsLayout];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView setFrame:CGRectMake(10.0f,
                                        10.0f,
                                        50.0f,
                                        50.0f)];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    [self.textLabel setFrame:CGRectMake(70,
                                        10,
                                        240,
                                        20)];
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] calculateRowHeight:post] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
    
}

+ (CGFloat )calculateRowHeight:(MBPostData *)post_temp
{
    CGSize size =[post_temp.sText sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220, CGFLOAT_MAX)];
    return size.height+50;
}


@end
