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
    
    self.drawn = NO;
    
    self.raffleId = @"";
    self.name = @"";
    self.type = @"";
    self.url = @"";
    self.createdAt = @"";
    self.updatedAt = @"";
    
    return self;
}

@end
