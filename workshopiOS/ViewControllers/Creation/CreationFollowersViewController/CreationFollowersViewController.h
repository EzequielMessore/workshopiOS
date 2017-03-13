//
//  CreationFollowersViewController.h
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-06.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreationFollowersViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *raffleNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfWinnersTextField;

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)drawButtonTouched:(id)sender;

@end
