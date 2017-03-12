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

@interface RaffleManager : AFNetworkingManager

+(RaffleManager*) sharedInstance;
-(void)getRafflesWithCompletion:(void (^) (BOOL isSuccess, NSArray *raffles, int count, NSString *message, NSError *error)) completion;

@end
