//
//  PersonTableViewCell.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"

@interface PersonTableViewCell : MGSwipeTableCell

@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;

@end
