//
//  HomeViewController.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-06.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "HomeViewController.h"
#import "RaffleDetailViewController.h"
#import "AppUtils.h"

@interface HomeViewController ()

@property (strong, nonatomic) NSArray *rafflesArray;
@property (strong, nonatomic) NSDictionary *responseDictionary;
@property (nonatomic, retain) NSData* responseData;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Title
    self.navigationItem.titleView = [AppUtils createTitleLabelWithString:@"Home"];
    
    //Right Button - Add Button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createRaffleTapped:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //Initiations
    self.rafflesArray = [NSArray new];
    self.responseDictionary = [NSDictionary new];
    
    //Empty Sate
    [self.emptyStateView setHidden:YES];
    [self.emptyStateView.message setText:@"Coming Soon!"];
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

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RaffleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"raffleCell" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[RaffleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"raffleCell"];
    }
    
    MGSwipeButton *editButton = [MGSwipeButton buttonWithTitle:@"Copy URL" backgroundColor:COLOR_TULIPE];
    editButton.buttonWidth = 100;
    cell.rightButtons = @[editButton];
    cell.rightSwipeSettings.transition = MGSwipeTransitionDrag;
    cell.delegate = self;
    
    [cell.raffleNameLabel setText:[NSString stringWithFormat:@"Raffle %lu", (long)indexPath.row]];
    [cell.raffleUrlLabel setText:[NSString stringWithFormat:@"www.sorteia.eu/sorteio%lu", (long)indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Creation" bundle:nil];
    RaffleDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"RaffleDetailVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion {
    
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [AppUtils createTableViewHeaderWithTitle:@"YOUR RAFFLES" andView:self.view];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25.0f;
}

#pragma mark - IBActions

-(IBAction)createRaffleTapped:(id)sender {
    [self.navigationController.tabBarController setSelectedIndex:1];
}


- (IBAction)segmentedControlTouched:(id)sender {
    if(self.segmentedControl.selectedSegmentIndex == 0) {
        [self.emptyStateView setHidden:YES];
    } else {
        [self.emptyStateView setHidden:NO];
    }
}

@end
