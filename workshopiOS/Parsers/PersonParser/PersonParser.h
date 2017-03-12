//
//  PersonParser.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonParser : NSObject

-(Person *)parseToPerson:(NSDictionary *)personToParse;

@end
