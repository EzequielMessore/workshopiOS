//
//  RaffleTypeViewController.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "RaffleTypeViewController.h"
#import "CreationFollowersViewController.h"
#import "AppUtils.h"

@interface RaffleTypeViewController ()

@end

@implementation RaffleTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Title
    self.navigationItem.titleView = [AppUtils createTitleLabelWithString:@"Raffle Type"];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMessageFromNotification:) name:@"retweetNotification" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"retweetNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

-(void)showMessageFromNotification:(NSNotification *)notification {
    NSString *message = (NSString *)notification.object;
    [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"createFollowersSegue"]) {
        CreationFollowersViewController *vc = [segue destinationViewController];
        vc.hidesBottomBarWhenPushed = YES;
    } else if ([segue.identifier isEqualToString:@"createRetweetSegue"]) {
        CreationRetweetViewController *vc = [segue destinationViewController];
        vc.delegate = self;
    }
}

- (IBAction)followersRaffleTouched:(id)sender {
    [self performSegueWithIdentifier:@"createFollowersSegue" sender:nil];
}

- (IBAction)retweetRaffleTouched:(id)sender {
    [self performSegueWithIdentifier:@"createRetweetSegue" sender:nil];
}

#pragma mark - Retweet Delegate

-(void)triedToCreateRetweetRaffleWithMessage:(NSString *)message {
    [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
}

@end
