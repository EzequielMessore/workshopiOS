//
//  DrawParser.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "DrawParser.h"
#import "PersonParser.h"

@implementation DrawParser

-(Draw *)parseToDraw:(NSDictionary *)drawToParse {
    Draw *draw = [Draw new];
    
    if([drawToParse objectForKey:@"id"]) {
        draw.drawId = [[drawToParse objectForKey:@"id"] intValue];
    }
    
    if([drawToParse objectForKey:@"disqualified"]) {
        draw.disqualified = [[drawToParse objectForKey:@"disqualified"] boolValue];
    }
    
    if([drawToParse objectForKey:@"reason"]) {
        if(![[drawToParse objectForKey:@"reason"] isKindOfClass:[NSNull class]]) {
            draw.disqualifiedReason = [drawToParse objectForKey:@"reason"];
        }
    }
    if([drawToParse objectForKey:@"createdAt"]) {
        double timestampval =  [[drawToParse objectForKey:@"createdAt"] doubleValue];
        NSTimeInterval timestamp = (NSTimeInterval)timestampval;
        NSDate *createdtimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];
        
        draw.createdAt = [NSString stringWithFormat:@"%@", createdtimestamp];
    }
    if([drawToParse objectForKey:@"updatedAt"]) {
        if(![[drawToParse objectForKey:@"updatedAt"] isKindOfClass:[NSNull class]]) {
            double timestampval =  [[drawToParse objectForKey:@"updatedAt"] doubleValue];
            NSTimeInterval timestamp = (NSTimeInterval)timestampval;
            NSDate *updatedtimestamp = [NSDate dateWithTimeIntervalSince1970:timestamp];
            
            draw.updatedAt = [NSString stringWithFormat:@"%@", updatedtimestamp];
        }
    }
    
    //Profile Info
    NSDictionary *profile = [drawToParse objectForKey:@"profile"];
    PersonParser *personParser = [PersonParser new];
    draw.person = [personParser parseToPerson:profile];
    
    return draw;
}

@end
