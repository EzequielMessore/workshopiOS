//
//  Person.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) int twitterId;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *picture;

@end
