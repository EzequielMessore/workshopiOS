//
//  RaffleParser.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "RaffleParser.h"

@implementation RaffleParser

-(Raffle *)parseToRaffle:(NSDictionary *)raffleToParse {
    Raffle *raffle = [Raffle new];
    
    if([raffleToParse objectForKey:@"drawn"]) {
        raffle.drawn = [[raffleToParse objectForKey:@"drawn"] boolValue];
    }
    
    if([raffleToParse objectForKey:@"hash"]) {
        raffle.raffleId = [raffleToParse objectForKey:@"hash"];
    }
    if([raffleToParse objectForKey:@"name"]) {
        raffle.name = [raffleToParse objectForKey:@"name"];
    }
    if([raffleToParse objectForKey:@"type"]) {
        raffle.type = [raffleToParse objectForKey:@"type"];
    }
    if([raffleToParse objectForKey:@"url"]) {
        if(![[raffleToParse objectForKey:@"url"] isKindOfClass:[NSNull class]]) {
            raffle.url = [raffleToParse objectForKey:@"url"];
        }
    }
    if([raffleToParse objectForKey:@"createdAt"]) {
        double timestampval =  [[raffleToParse objectForKey:@"createdAt"] doubleValue];
        NSTimeInterval timestamp = (NSTimeInterval)timestampval;
        NSDate *createdtimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];

        raffle.createdAt = [NSString stringWithFormat:@"%@", createdtimestamp];
    }
    if([raffleToParse objectForKey:@"updatedAt"]) {
        if(![[raffleToParse objectForKey:@"updatedAt"] isKindOfClass:[NSNull class]]) {
            double timestampval =  [[raffleToParse objectForKey:@"updatedAt"] doubleValue];
            NSTimeInterval timestamp = (NSTimeInterval)timestampval;
            NSDate *updatedtimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];
            
            raffle.updatedAt = [NSString stringWithFormat:@"%@", updatedtimestamp];
        }
    }
    
    return raffle;
}

@end
