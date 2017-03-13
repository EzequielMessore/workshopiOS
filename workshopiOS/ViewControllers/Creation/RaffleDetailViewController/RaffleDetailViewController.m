//
//  RaffleDetailViewController.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "RaffleDetailViewController.h"
#import "RaffleManager.h"
#import "Constants.h"
#import "AppUtils.h"

@interface RaffleDetailViewController ()

@property (nonatomic) int drawsCount;

@property (strong, nonatomic) NSMutableArray *drawsArray;

@end

@implementation RaffleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Title
    self.navigationItem.titleView = [AppUtils createTitleLabelWithString:@"Raffle Detail"];
    
    //Initializations
    self.drawsCount = 0;
    self.drawsArray = [NSMutableArray new];

    //Don't forget to register the cell when programatically setting the constraints
    [[self tableView] registerClass:[PersonTableViewCell class] forCellReuseIdentifier:personCellIdentifier];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getRaffle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

-(void)fillUpScreen {
    if(self.isCreatingRaffle) {
        [self.navigationItem setHidesBackButton:YES];
        UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
        self.navigationItem.rightBarButtonItem = done;
    } else {
        [self.navigationItem setHidesBackButton:NO];
    }
    
    [self.raffleNameLabel setText:self.currentRaffle.name];
    [self.createdOnLabel setText:[NSString stringWithFormat:@"created on %@", [AppUtils formatDateWithTime:self.currentRaffle.createdAt]]];
}

-(void)getRaffle {
    [AppUtils startLoadingInView:self.view];
    [[RaffleManager sharedInstance]getSpecifiRaffleWithRaffleHash:self.currentRaffle.raffleId andCompletion:^(BOOL isSuccess, Raffle *raffle, NSString *message, NSError *error) {
        [AppUtils stopLoadingInView:self.view];
        if(isSuccess) {
            self.currentRaffle = raffle;
            [self getDrawns];
        } else {
            [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
        }
    }];
}

-(void)getDrawns {
    [AppUtils startLoadingInView:self.view];
    [[RaffleManager sharedInstance]getAllDrawsWithRaffleHash:self.currentRaffle.raffleId andCompletion:^(BOOL isSuccess, NSArray *draws, int count, NSString *message, NSError *error) {
        [AppUtils stopLoadingInView:self.view];
        if(isSuccess) {
            [self.drawsArray removeAllObjects];
            [self.drawsArray addObjectsFromArray:draws];
            self.drawsCount = count;
            [self fillUpScreen];
            [self.tableView reloadData];
        } else {
            [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.drawsCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personCellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personCellIdentifier];
    }
    
    Draw *draw = [self.drawsArray objectAtIndex:indexPath.row];
    
    cell = [cell fillUpCellWithPerson:draw.person];
    cell.delegate = self;
    cell.indexPath = indexPath;
    
    if(draw.disqualified) {
        [cell setBackgroundColor:COLOR_ISABELLINE];
        [cell setUserInteractionEnabled:NO];
        [cell.disquilifiedLabel setHidden:NO];
    } else {
        [cell setBackgroundColor:COLOR_WHITE];

        MGSwipeButton *button = [MGSwipeButton buttonWithTitle:@"Disquilify" backgroundColor:COLOR_CHARCOAL];
        button.buttonWidth = 100;
        cell.rightButtons = @[button];
        cell.rightSwipeSettings.transition = MGSwipeTransitionDrag;

        [cell setUserInteractionEnabled:YES];
        [cell.disquilifiedLabel setHidden:YES];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [AppUtils createTableViewHeaderWithTitle:@"WINNERS" andView:self.view];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion {
    PersonTableViewCell *personCell = (PersonTableViewCell *)cell;
    Draw *draw = [self.drawsArray objectAtIndex:personCell.indexPath.row];
    
    [[RaffleManager sharedInstance]disquilifyDraw:draw.drawId andRaffleHash:self.currentRaffle.raffleId andReason:@"Cause I can :D" andCompletion:^(BOOL isSuccess, NSString *message, NSError *error) {
        if(isSuccess) {
            [self getDrawns];
        } else {
            [self.navigationController presentViewController:[AppUtils setupAlertWithMessage:message] animated:YES completion:nil];
        }
    }];
    
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - IBActions

-(IBAction)doneTouched:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end
