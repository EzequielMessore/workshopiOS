//
//  RaffleManager.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "RaffleManager.h"
#import "Urls.h"

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

-(void)getRafflesWithCompletion:(void (^) (BOOL isSuccess, NSArray *raffles, NSString *message, NSError *error)) completion {
    
    [self callApiWithParameters:nil andURL:URL_RAFFLE andRequestType:@"GET" andCompletion:^(id response, BOOL isSuccess, NSString *message, NSError *error) {
        if(isSuccess) {
            NSArray *responseArray = (NSArray *)response;
            NSMutableArray *raffles = [NSMutableArray new];
            
            RaffleParser *raffleParser = [RaffleParser new];
            for (NSDictionary *raffleDictionary in responseArray) {
                [raffles addObject:[raffleParser parseToRaffle:raffleDictionary]];
            }
            completion(YES, raffles, nil, nil);
        } else {
            completion(NO, nil, message, error);
        }
    }];
}

@end
