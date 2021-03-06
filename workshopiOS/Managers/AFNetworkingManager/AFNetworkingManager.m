//
//  AFNetworkingManager.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-03-03.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "AFNetworkingManager.h"
#import "AFHTTPSessionManager.h"
#import "AppUtils.h"
#import "Constants.h"

@implementation AFNetworkingManager

static AFNetworkingManager *sharedInstance = nil;
static AFHTTPSessionManager *manager = nil;

/*!
 * @discussion Setup a singleton of AFNetworkingManager
 * @return this instance will make all the HTTP calls.
 */
+ (AFNetworkingManager*)sharedInstance {
    if(sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
        
        manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
    }
    return sharedInstance;
}

-(void)callAPIWithParameters:(NSDictionary *)parameters andUrl:(NSString *)url andMethodType:(NSString *)methodType andCompletion:(void(^) (BOOL success, id response, NSString *message, NSError *error)) completion {
    
    //Checks if there's a token to add to header
    if([AppUtils retrieveFromUserDefaultWithKey:API_TOKEN]) {
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", [AppUtils retrieveFromUserDefaultWithKey:API_TOKEN]] forHTTPHeaderField:@"Authorization"];
    }
    
    //Chooses method type
    if([methodType isEqualToString:@"GET"]) {
        [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(YES, responseObject, nil, nil);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSDictionary *errorDictionary = error.userInfo;
            completion(NO, nil, [errorDictionary objectForKey:@"NSLocalizedDescription"], error);
        }];
        
    } else if([methodType isEqualToString:@"POST"]) {
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(YES, responseObject, nil, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSDictionary *errorDictionary = error.userInfo;
            completion(NO, nil, [errorDictionary objectForKey:@"NSLocalizedDescription"], error);
        }];
        
    } else if([methodType isEqualToString:@"PUT"]) {
        [manager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completion(YES, responseObject, nil, nil);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSDictionary *errorDictionary = error.userInfo;
            completion(NO, nil, [errorDictionary objectForKey:@"NSLocalizedDescription"], error);
        }];
    }
}

@end
