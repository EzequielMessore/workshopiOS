//
//  LoginManager.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "AFNetworkingManager.h"

@interface LoginManager : AFNetworkingManager

+(LoginManager*) sharedInstance;
-(void)loginWithParameters:(NSDictionary *)parameters andCompletion:(void (^) (BOOL isSuccess, NSString *message, NSError *error)) completion;

@end
