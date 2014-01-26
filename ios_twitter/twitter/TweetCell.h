//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tweetUserImgView;
@property (weak, nonatomic) IBOutlet UILabel *tweetUserAccountLabel;

@property (weak, nonatomic) IBOutlet UILabel * tweetUserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * tweetTimeLabel;
//@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UILabel * tweetLabel;

@end
