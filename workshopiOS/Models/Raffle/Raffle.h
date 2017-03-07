//
//  Raffle.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Raffle : NSObject

@property (nonatomic) int raffleId;
@property (nonatomic) int numberOfWinners;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *drawnAt;
@property (strong, nonatomic) NSString *creatorName;
@property (strong, nonatomic) NSArray *winners;
@property (strong, nonatomic) NSArray *participants;



@end
