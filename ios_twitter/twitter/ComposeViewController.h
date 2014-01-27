//
//  ComposeViewController.h
//  twitter
//
//  Created by Rakhesh on 1/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserScreenLabel;
@property (weak, nonatomic) IBOutlet UITextView *TweetTextComposeView;
@property (strong, nonatomic) NSString *replyUserId;

@end
