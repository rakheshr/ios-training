//
//  ComposeViewController.m
//  twitter
//
//  Created by Rakhesh on 1/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import <UIImageView+AFNetworking.h>

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.TweetTextComposeView.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(unloadCompose)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(sendTweet)];
    User *currentUser = [User currentUser];
    NSLog(@"Current User %@",[currentUser objectForKey:@"name"]);
    self.UserNameLabel.text =[currentUser objectForKey:@"name"];
    self.UserScreenLabel.text = [NSString stringWithFormat:@"@%@",[currentUser objectForKey:@"screen_name"]];
    
    
    NSString *profileImage = [currentUser objectForKey:@"profile_image_url_https"];
    NSLog(@"URL %@", profileImage);
    
    NSURL *profileImageURL = [NSURL URLWithString:profileImage];
    if(nil != profileImageURL){
        [self.userImageView setImageWithURL:profileImageURL];
    }
    
    if(nil != self.replyUserId){
        self.TweetTextComposeView.text = [NSString stringWithFormat:@"@%@", self.replyUserId];
    }
    [self.TweetTextComposeView becomeFirstResponder];
}

- (void)unloadCompose
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendTweet
{
    NSLog(@"On tweet button called");
    NSString* status = self.TweetTextComposeView.text;
    [[TwitterClient instance] tweetReplyWithUserTweet:status inReplyToUser:nil success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@" Response %@", response);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"");
    } ];
     
     
     [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) textViewShouldBeginEditing:(UITextView *)textView{
    [textView setTextColor:[UIColor blackColor]];
    if(nil == self.replyUserId){
        textView.text =@"";
    }

    return YES;
}


- (IBAction)OnTapAction:(id)sender {
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
