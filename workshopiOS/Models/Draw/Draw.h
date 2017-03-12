//
//  Draw.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Draw : NSObject

@property (nonatomic) BOOL disqualified;

@property (nonatomic) int personId;

@property (strong, nonatomic) NSString *disqualifiedReason;
@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *updatedAt;

@property (strong, nonatomic) Person *person;

@end
