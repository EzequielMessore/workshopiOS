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

//UIAlertController with ok action
+(UIAlertController*)setupAlertWithMessage:(NSString*)message {
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@"Attention" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [myAlertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [myAlertController addAction: ok];
    
    return myAlertController;
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

//Text Field
+(void)setTextFieldLeftImageWithImage:(UIImage *)image andTextField:(UITextField *)textField andPadding:(CGFloat)leftPadding {
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(leftPadding, 0, 20, 20)];
    imageView.image = image;
    [imageView.layer setMasksToBounds:YES];
    
    double width = leftPadding + 20;
    
    if(textField.borderStyle == UITextBorderStyleLine || textField.borderStyle == UITextBorderStyleNone) {
        width += 5;
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 20)];
    [view addSubview:imageView];
    
    textField.leftView = view;
}

@end
