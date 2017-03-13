//
//  RaffleTypeViewController.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreationRetweetViewController.h"

@interface RaffleTypeViewController : UIViewController <RetweetCreationDelegate>

- (IBAction)followersRaffleTouched:(id)sender;
- (IBAction)retweetRaffleTouched:(id)sender;

@end
