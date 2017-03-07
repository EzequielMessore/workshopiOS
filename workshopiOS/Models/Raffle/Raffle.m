//
//  Raffle.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "Raffle.h"

@implementation Raffle

-(instancetype)init {
    self = [super init];
    
    self.numberOfWinners = 0;
    
    self.name = @"";
    self.createdAt = @"";
    self.drawnAt = @"";
    self.creatorName = @"";
    
    self.winners = [NSArray new];
    self.participants = [NSArray new];
    
    return self;
}

@end
