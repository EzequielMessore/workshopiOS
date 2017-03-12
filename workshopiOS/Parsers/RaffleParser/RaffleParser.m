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
        raffle.drawn = (BOOL)[raffleToParse objectForKey:@"drawn"];
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
        raffle.url = [raffleToParse objectForKey:@"url"];
    }
    if([raffleToParse objectForKey:@"createdAt"]) {
        raffle.createdAt = [raffleToParse objectForKey:@"createdAt"];
    }
    if([raffleToParse objectForKey:@"updatedAt"]) {
        raffle.updatedAt = [raffleToParse objectForKey:@"updatedAt"];
    }
    
    return raffle;
}

@end
