//
//  LoginManager.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "LoginManager.h"
#import "Urls.h"
#import "AppUtils.h"

@implementation LoginManager

static LoginManager *sharedInstance = nil;

/*!
 * @discussion Setup a singleton of LoginManager
 * @return this instance will make all the HTTP calls.
 */
+ (LoginManager*)sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
        [super sharedInstance];
    }
    return sharedInstance;
}

-(void)loginWithParameters:(NSDictionary *)parameters andCompletion:(void (^) (BOOL isSuccess, NSString *message, NSError *error)) completion {
    
    //Nil for now, when integrated with Twitter the parameters will change
    [self callAPIWithParameters:nil andUrl:URL_LOGIN andMethodType:@"POST" andCompletion:^(BOOL success, id response, NSString *message, NSError *error) {
        if(success) {
            NSDictionary *responseDictionary = (NSDictionary *)[response objectForKey:@"data"];
            
            [AppUtils saveToUserDefault:[responseDictionary objectForKey:@"token"] withKey:API_TOKEN];
            
            completion(YES, nil, nil);
        } else {
            completion(NO, message, error);
        }
    }];
}

@end
