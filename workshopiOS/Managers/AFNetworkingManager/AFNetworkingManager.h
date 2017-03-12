//
//  AFNetworkingManager.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-03-03.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetworkingManager : NSObject

+(AFNetworkingManager*) sharedInstance;
-(void)callAPIWithParameters:(NSDictionary *)parameters andUrl:(NSString *)url andMethodType:(NSString *)methodType andCompletion:(void(^) (BOOL success, id response, NSString *message, NSError *error)) completion;

@end
