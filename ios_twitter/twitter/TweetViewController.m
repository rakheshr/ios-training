//
//  TweetViewController.m
//  twitter
//
//  Created by Rakhesh on 1/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"
#import <UIImageView+AFNetworking.h>
#import "ComposeViewController.h"
#import <UIKit/UIKit.h>

@interface TweetViewController ()

@end

@implementation TweetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithTweet:(Tweet *)tweet{
    
    self = [self initWithNibName:@"TweetViewController" bundle:nil];
    if (self) {
        self.tweet = tweet;
    }
    return self;
}

- (void)loadButton
{
    UIColor *tweetColor = [UIColor colorWithRed:0.071f green:0.573f blue:0.824f alpha:1.0f];
    self.navigationController.navigationBar.backgroundColor = tweetColor;
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((10, 10, 10, 10))];
    
    UIImage *image = [UIImage imageNamed:@"compose.png"];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(initiateCompose)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    //[self.navigationController.navigationBar.topItem setTitleView:imageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Tweet %@", self.tweet.tweetUsr.userName);
    [self loadButton];
    self.tweetlabel.text = self.tweet.text;
    NSURL *profileImageURL = [NSURL URLWithString:self.tweet.tweetUsr.profileUrl];
    if(nil != profileImageURL){
        [self.profileImage setImageWithURL:profileImageURL];
    }
    self.favoriteCount.text = [NSString stringWithFormat:@"%@ FAVORITES", self.tweet.favorites];
    self.retweetCount.text = [NSString stringWithFormat:@"%@ RETWEET", self.tweet.reTweets];
    
    



}


- (void) initiateCompose
{
    NSLog(@"Compose called");
    ComposeViewController *composeViewController = [[ComposeViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:composeViewController];
    [self presentViewController:nvc animated:YES completion:nil];
//     [self.navigationController pushViewController:nvc animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reTweetAction:(id)sender {
}
- (IBAction)favoriteAction:(id)sender {
}

- (IBAction)replyTweet:(id)sender {
}







@end
