//
//  AppUtils.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface AppUtils : NSObject

+(void) saveToUserDefault:(NSObject*)objectToSave withKey:(NSString*)key;
+(NSObject*) retrieveFromUserDefaultWithKey:(NSString*)key;
+(void) clearUserDefault;

+(UILabel *)createTitleLabelWithString:(NSString *)title;
+(UIView *)createTableViewHeaderWithTitle:(NSString *)title andView:(UIView *)view;
+(void)setTextFieldLeftImageWithImage:(UIImage *)image andTextField:(UITextField *)textField andPadding:(CGFloat)leftPadding;

@end
