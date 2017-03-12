//
//  NSURLSessionManager.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "NSURLSessionManager.h"
#import "AppUtils.h"
#import "Constants.h"

@implementation NSURLSessionManager

static NSURLSessionManager *sharedInstance = nil;
static NSMutableURLRequest *request = nil;

/*!
 * @discussion Configura um singleton do NSURLSessionManager
 * @return instancia do NSURLSessionManager responsável por todas as chamadas a métodos dessa classe.
 */
+ (NSURLSessionManager*)sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [configuration setTimeoutIntervalForRequest:50.0];
        
        request = [[NSMutableURLRequest alloc]init];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    }
    return sharedInstance;
}

-(void)callApiWithParameters:(NSDictionary *)parameters andURL:(NSString *)url andRequestType:(NSString *)requestType andCompletion:(void (^) (id response, BOOL isSuccess, NSString *message, NSError *error)) completion {
    
    NSString *apiToken = [NSString stringWithFormat:@"%@",[AppUtils retrieveFromUserDefaultWithKey:API_TOKEN]];
    if(![apiToken isEqualToString:@""]) {
        [request setValue:apiToken forHTTPHeaderField:@"Authorization"];
    }
    
    [request setHTTPMethod:requestType];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil]];
    
    NSLog(@"%@", request);
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // handle response
        if ([data length] >0 && error == nil) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSDictionary *question = [jsonDict objectForKey:@"data"];
            NSLog(@"%@", question);
            
            completion(response, YES, nil, nil);
        } else {
            completion(nil, NO, @"error", error);
        }
    }] resume];
}
@end
