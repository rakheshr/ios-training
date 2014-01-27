//
//  TweetViewController.h
//  twitter
//
//  Created by Rakhesh on 1/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetViewController : UIViewController

@property (nonatomic, strong) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (nonatomic, weak) IBOutlet UILabel *tweetlabel;

@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;

@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
- (id) initWithTweet:(Tweet *)tweet;
@end
