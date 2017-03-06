//
//  PersonTableViewCell.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"

static NSString * const personCellIdentifier = @"personCell";

@interface PersonTableViewCell : MGSwipeTableCell {
    NSString *reuseID;
}

@property (strong, nonatomic) UIImageView *personImageView;
@property (strong, nonatomic) UILabel *personNameLabel;
@property (strong, nonatomic) UIView *separatorView;


//The parameter will be of type Person after getting content from API
-(PersonTableViewCell *)fillUpCellWithPerson:(NSString *)personName;

@end
