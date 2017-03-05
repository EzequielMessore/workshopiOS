//
//  AppUtils.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

#pragma mark - User Defaults

+(void) saveToUserDefault:(NSObject*)objectToSave withKey:(NSString*)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:objectToSave forKey:key];
    [userDefaults synchronize];
}

+(NSObject*) retrieveFromUserDefaultWithKey:(NSString*)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void) clearUserDefault {
    [AppUtils saveToUserDefault:nil withKey:API_TOKEN];
}

//Title View
+(UILabel *)createTitleLabelWithString:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = NSLocalizedString(title, @"");
    [label sizeToFit];
    
    return label;
}

//Table Header
+(UIView *)createTableViewHeaderWithTitle:(NSString *)title andView:(UIView *)view {
    //    NSLog( @"%@", [UIFont fontNamesForFamilyName:@"Apple SD Gothic Neo"]);
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 24)];
    headerView.backgroundColor = COLOR_ORIOLES_ORANGE;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(16, ((headerView.frame.size.height-8)/2), (view.frame.size.width - 32) , 8)];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:9];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    [label sizeToFit];
    [headerView addSubview:label];
    
    return headerView;
}

@end
