//
//  RaffleDetailViewController.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTableViewCell.h"
#import "Raffle.h"

@interface RaffleDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate>

@property (strong, nonatomic) Raffle *currentRaffle;
@property (nonatomic) BOOL isCreatingRaffle;

@property (weak, nonatomic) IBOutlet UILabel *raffleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdOnLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
