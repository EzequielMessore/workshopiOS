//
//  HomeViewController.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-06.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RaffleTableViewCell.h"

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentedControlTouched:(id)sender;


@end
