//
//  RaffleManager.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "RaffleManager.h"
#import "Urls.h"
#import "AppUtils.h"

@implementation RaffleManager

static RaffleManager *sharedInstance = nil;

/*!
 * @discussion Configura um singleton do RaffleManager
 * @return instancia do RaffleManager responsável por todas as chamadas a métodos dessa classe.
 */
+ (RaffleManager*)sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
        [super sharedInstance];
    }
    return sharedInstance;
}

-(void)getSpecifiRaffleWithRaffleHash:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error)) completion {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", URL_RAFFLE, raffleHash];
    
    
    [self callAPIWithParameters:nil andUrl:url andMethodType:@"GET" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            NSDictionary *responseDictionary = (NSDictionary *)[response objectForKey:@"data"];
            
            RaffleParser *raffleParser = [RaffleParser new];
            Raffle *raffle = [raffleParser parseToRaffle:responseDictionary];
            
            completion(YES, raffle, nil, nil);
        } else {
            completion(NO, nil, message, error);
        }
    }];
}

-(void)getRafflesWithCompletion:(void (^) (BOOL isSuccess, NSArray *raffles, int count, NSString *message, NSError *error)) completion {
    
    [self callAPIWithParameters:nil andUrl:URL_RAFFLE andMethodType:@"GET" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            NSDictionary *responseDictionary = (NSDictionary *)[response objectForKey:@"data"];
            NSMutableArray *raffles = [NSMutableArray new];
            
            int count = [[responseDictionary objectForKey:@"count"] intValue];
            
            RaffleParser *raffleParser = [RaffleParser new];
            for (NSDictionary *raffleDictionary in [responseDictionary objectForKey:@"list"]) {
                [raffles addObject:[raffleParser parseToRaffle:raffleDictionary]];
            }
            completion(YES, raffles, count, nil, nil);
        } else {
            completion(NO, nil, 0, message, error);
        }
    }];
}

-(void)createRaffleWithParameters:(NSDictionary *)parameters andCompletion:(void (^) (BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error)) completion {
    
    [self callAPIWithParameters:parameters andUrl:URL_RAFFLE andMethodType:@"POST" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            NSDictionary *responseDictionary = (NSDictionary *)[response objectForKey:@"data"];
            
            RaffleParser *raffleParser = [RaffleParser new];
            Raffle *raffle = [raffleParser parseToRaffle:responseDictionary];

            completion(YES, raffle, nil, nil);
        } else {
            completion(NO, nil, message, error);
        }
    }];
}

-(void)drawRaffleWithParameters:(NSDictionary *)parameters andRaffleHas:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, NSString *message, NSError *error)) completion {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/draws", URL_RAFFLE, raffleHash];
    
    [self callAPIWithParameters:parameters andUrl:url andMethodType:@"POST" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            completion(YES, nil, nil);
        } else {
            completion(NO, message, error);
        }
    }];
}

-(void)getAllDrawsWithRaffleHash:(NSString *)raffleHash andCompletion:(void (^) (BOOL isSuccess, NSArray *draws, int count, NSString *message, NSError *error)) completion {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/draws", URL_RAFFLE, raffleHash];
    
    
    [self callAPIWithParameters:nil andUrl:url andMethodType:@"GET" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            NSDictionary *responseDictionary = (NSDictionary *)[response objectForKey:@"data"];
            NSMutableArray *draws = [NSMutableArray new];
            
            int count = [[responseDictionary objectForKey:@"count"] intValue];
            
            DrawParser *drawParser = [DrawParser new];
            for (NSDictionary *drawDictionary in [responseDictionary objectForKey:@"list"]) {
                [draws addObject:[drawParser parseToDraw:drawDictionary]];
            }
            
            completion(YES, draws, count, nil, nil);
        } else {
            completion(NO, nil, 0, message, error);
        }
    }];
}


@end
