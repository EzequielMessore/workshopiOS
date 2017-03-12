//
//  Raffle.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Raffle : NSObject

@property (nonatomic) BOOL drawn;

@property (strong, nonatomic) NSString *raffleId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *updatedAt;

@end
