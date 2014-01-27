//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Edited by Rakhesh on 1/23/2014
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)timestamp {
    return [self.data valueOrNilForKeyPath:@"created_at"];
}

- (NSDictionary *) user {
    return [self.data valueOrNilForKeyPath:@"user"];
    
}

- (TweetUser *) tweetUsr {
    TweetUser *tweetUsr = [[TweetUser alloc]init];
    NSDictionary *userDic =  [self.data valueOrNilForKeyPath:@"user"];
    tweetUsr.screenName = [userDic valueOrNilForKeyPath:@"screen_name"];
    tweetUsr.userName = [userDic valueOrNilForKeyPath:@"name"];
    tweetUsr.profileUrl = [userDic valueOrNilForKeyPath:@"profile_image_url"];
//    NSLog(@"&&&&&& TweetUSer = %@", tweetUsr.screenName);

    
    return tweetUsr;
}

- (NSString *) tweetIntervalFromNow {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE MMM dd HH:mm:ss +zzzz yyyy"];
    NSDate *createDate = [self.data valueOrNilForKeyPath:@"created_at"];
    NSTimeInterval interval = -[createDate timeIntervalSinceNow];
    interval = interval/60/60;
    NSString *intervalString = [NSString stringWithFormat:@"%dh", (int)round(interval)];
    return intervalString;
    
}

- (NSString *) reTweets {
    return  [self.data valueOrNilForKeyPath:@"retweet_count"];
}

- (NSString *) favorites {
    return  [self.data valueOrNilForKeyPath:@"favorite_count"];
}

- (NSString *) tweetId {
    return  [self.data valueOrNilForKeyPath:@"id"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
