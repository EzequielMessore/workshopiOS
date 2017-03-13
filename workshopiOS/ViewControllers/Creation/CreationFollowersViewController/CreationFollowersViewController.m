//
//  CreationFollowersViewController.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-06.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "CreationFollowersViewController.h"
#import "RaffleDetailViewController.h"
#import "RaffleManager.h"
#import "AppUtils.h"

@interface CreationFollowersViewController ()

@property (strong, nonatomic) Raffle *createdRaffle;

@end

@implementation CreationFollowersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Title
    self.navigationItem.titleView = [AppUtils createTitleLabelWithString:@"Followers Raffle"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"raffleDetailSegue"]) {
        RaffleDetailViewController *vc = [segue destinationViewController];
        vc.currentRaffle = self.createdRaffle;
        vc.isCreatingRaffle = YES;
        vc.hidesBottomBarWhenPushed = YES;
    }
}

#pragma mark - TextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBActions

- (IBAction)hideKeyboard:(id)sender {
    [self.raffleNameTextField resignFirstResponder];
    [self.numberOfWinnersTextField resignFirstResponder];
}

- (IBAction)drawButtonTouched:(id)sender {
    
    NSDictionary *creationParameters = @{@"type" : TYPE_FOLLOWER,
                                         @"name" : self.raffleNameTextField.text};
    
    NSDictionary *drawnParameters = @{@"winners" : self.numberOfWinnersTextField.text};
    
    [AppUtils startLoadingInView:self.view];
    [[RaffleManager sharedInstance]createRaffleWithParameters:creationParameters andCompletion:^(BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error) {
        if(isSuccess) {
            [AppUtils stopLoadingInView:self.view];
            self.createdRaffle = raffle;
            
            [AppUtils startLoadingInView:self.view];
            [[RaffleManager sharedInstance]drawRaffleWithParameters:drawnParameters andRaffleHas:self.createdRaffle.raffleId andCompletion:^(BOOL isSuccess, NSString *message, NSError *error) {
                [AppUtils stopLoadingInView:self.view];
                if(isSuccess) {
                    [self performSegueWithIdentifier:@"raffleDetailSegue" sender:self.createdRaffle];
                } else {
                    [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
                }
            }];
        } else {
            [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
        }
    }];
    
}

@end
