//
//  LoginViewController.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "LoginViewController.h"
#import "AppUtils.h"
#import "LoginManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NavigationBar hidden so the background color takes all the screen
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [AppUtils setTextFieldLeftImageWithImage:[UIImage imageNamed:@"ic_lock_white_48pt"] andTextField:self.emailTextField andPadding:5.0];
    [AppUtils setTextFieldLeftImageWithImage:[UIImage imageNamed:@"ic_email_white_48pt"] andTextField:self.passwordTextField andPadding:5.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //Method called when hitting the return or done button
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBActions

- (IBAction)loginButtonTouched:(id)sender {
    [[LoginManager sharedInstance]loginWithParameters:nil andCompletion:^(BOOL isSuccess, NSString *message, NSError *error) {
        if(isSuccess) {
            //Dismiss is used with presentViewController
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
        }
    }];
    
    
}

- (IBAction)hideKeyboard:(id)sender {
    //There are two ways to close keyboard
    
    //Resigning each textfield
    //    [self.emailTextField resignFirstResponder];
    //    [self.passwordTextField resignFirstResponder];
    
    //Ending all editing
    [self.view endEditing:YES];
}

@end
