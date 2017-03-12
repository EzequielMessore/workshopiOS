//
//  RaffleManager.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

//#import "NSURLSessionManager.h"
#import "AFNetworkingManager.h"
#import "RaffleParser.h"
#import "DrawParser.h"

@interface RaffleManager : AFNetworkingManager

+(RaffleManager*) sharedInstance;
-(void)getRafflesWithCompletion:(void (^) (BOOL isSuccess, NSArray *raffles, int count, NSString *message, NSError *error)) completion;
-(void)createRaffleWithParameters:(NSDictionary *)parameters andCompletion:(void (^) (BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error)) completion;
-(void)drawRaffleWithParameters:(NSDictionary *)parameters andRaffleHas:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, NSString *message, NSError *error)) completion;
-(void)getSpecifiRaffleWithRaffleHash:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error)) completion;
-(void)getAllDrawsWithRaffleHash:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, NSArray *draws, int count, NSString *message, NSError *error)) completion;

@end
