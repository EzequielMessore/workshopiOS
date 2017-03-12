//
//  PersonParser.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "PersonParser.h"

@implementation PersonParser

-(Person *)parseToPerson:(NSDictionary *)personToParse {
    Person *person = [Person new];
    
    if([personToParse objectForKey:@"name"]) {
        person.name = [personToParse objectForKey:@"name"];
    }
    if([personToParse objectForKey:@"picture"]) {
        person.picture = [personToParse objectForKey:@"picture"];
    }
    
    if([personToParse objectForKey:@"twitterId"]) {
        person.twitterId = [[personToParse objectForKey:@"twitterId"] intValue];
    }
    
    return person;
}
@end
