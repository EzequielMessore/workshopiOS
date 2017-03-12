//
//  RaffleManager.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "NSURLSessionManager.h"
#import "RaffleParser.h"

@interface RaffleManager : NSURLSessionManager

+(RaffleManager*) sharedInstance;
-(void)getRafflesWithCompletion:(void (^) (BOOL isSuccess, NSArray *raffles, NSString *message, NSError *error)) completion;
-(void)testPostLoginWithParameters:(NSDictionary *)parameters andCompletion:(void (^) (BOOL isSuccess, NSString *message, NSError *error)) completion;

@end
