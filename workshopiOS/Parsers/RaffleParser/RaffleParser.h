//
//  RaffleParser.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Raffle.h"

@interface RaffleParser : NSObject

-(Raffle *)parseToRaffle:(NSDictionary *)raffleToParse;

@end
