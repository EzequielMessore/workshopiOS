//
//  LoginViewController.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "LoginViewController.h"
#import "AppUtils.h"

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
    [AppUtils saveToUserDefault:@"asjrq3473947" withKey:API_TOKEN];
    
    //Dismiss is used with presentViewController 
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
