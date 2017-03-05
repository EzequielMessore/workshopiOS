//
//  RaffleTableViewCell.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-12.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"

@interface RaffleTableViewCell : MGSwipeTableCell

@property (weak, nonatomic) IBOutlet UILabel *raffleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *raffleUrlLabel;

@end
