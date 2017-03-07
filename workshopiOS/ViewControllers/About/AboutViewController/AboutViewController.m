//
//  AboutViewController.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-06.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "AboutViewController.h"
#import "AppUtils.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Title
    self.navigationItem.titleView = [AppUtils createTitleLabelWithString:@"Sorteia.eu"];
    
    //Right Button - Add Button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logoutTouched:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
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

#pragma mark - IBActions

- (IBAction)mobileAppViewTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://yasminbenatti.org/"] options:@{} completionHandler:nil];
}

- (IBAction)apiViewTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/flavioheleno"] options:@{} completionHandler:nil];
}

- (IBAction)sorteiaEuLabelTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://sorteia.eu/"] options:@{} completionHandler:nil];
}

- (IBAction)githubImageViewTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/yabenatti/workshopObjC"] options:@{} completionHandler:nil];
}

-(IBAction)logoutTouched:(id)sender {
    [AppUtils clearUserDefault];
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
}

@end


