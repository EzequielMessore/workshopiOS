//
//  NSURLSessionManager.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-27.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSessionManager : NSObject

+(NSURLSessionManager*) sharedInstance;
-(void)callApiWithParameters:(NSDictionary *)parameters andURL:(NSString *)url andRequestType:(NSString *)requestType andCompletion:(void (^) (id response, BOOL isSuccess, NSString *message, NSError *error)) completion;

@end
