//
//  Draw.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "Draw.h"

@implementation Draw

-(instancetype)init {
    self = [super init];

    self.disqualified = NO;
    
    self.disqualifiedReason = @"";
    self.createdAt = @"";
    self.updatedAt = @"";
    
    self.person = [Person new];
    
    return self;
}

@end
