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

@end
