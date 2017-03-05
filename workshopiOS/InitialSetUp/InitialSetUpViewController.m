//
//  InitialSetUpViewController.m
//  workshopiOS
//
//  Created by Yasmin Benatti on 2017-03-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "InitialSetUpViewController.h"
#import "TabBarViewController.h"
#import "LoginViewController.h"
#import "AppUtils.h"

@interface InitialSetUpViewController ()

@end

@implementation InitialSetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Navigation Bar
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //1. Here, you can test if the user is authorized to use the app
    
//    [AppUtils saveToUserDefault:@"token" withKey:API_TOKEN];
    
    if(![AppUtils retrieveFromUserDefaultWithKey:API_TOKEN]) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        LoginViewController *vc = [sb instantiateInitialViewController];
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    } else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TabBarViewController *vc = [sb instantiateInitialViewController];
        [self.navigationController presentViewController:vc animated:NO completion:nil];
    }
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

@end
