//
//  DrawParser.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Draw.h"

@interface DrawParser : NSObject

-(Draw *)parseToDraw:(NSDictionary *)drawToParse;

@end
