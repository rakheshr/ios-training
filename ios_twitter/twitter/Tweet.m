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



+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
