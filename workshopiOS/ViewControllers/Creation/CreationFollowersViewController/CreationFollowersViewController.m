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

-(void)viewWillAppear:(BOOL)animated {
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

- (IBAction)hideKeyboard:(id)sender {
    [self.raffleNameTextField resignFirstResponder];
    [self.numberOfWinnersTextField resignFirstResponder];
}

- (IBAction)testButtonTouched:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Raffle Test" message:@"Fulano was drawn! Congratulations! :D \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn! \n Ciclano was drawn!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction: ok];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)drawButtonTouched:(id)sender {
    
    NSDictionary *creationParameters = @{@"type" : TYPE_FOLLOWER,
                                         @"name" : self.raffleNameTextField.text};
    
    NSDictionary *drawnParameters = @{@"winners" : self.numberOfWinnersTextField.text};
    
    [[RaffleManager sharedInstance]createRaffleWithParameters:creationParameters andCompletion:^(BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error) {
        if(isSuccess) {
            self.createdRaffle = raffle;
            
            [[RaffleManager sharedInstance]drawRaffleWithParameters:drawnParameters andRaffleHas:self.createdRaffle.raffleId andCompletion:^(BOOL isSuccess, NSString *message, NSError *error) {
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
