//
//  LoginViewController.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonTouched:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
