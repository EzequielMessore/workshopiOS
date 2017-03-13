//
//  CreationRetweetViewController.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmptyStateView.h"

@protocol RetweetCreationDelegate <NSObject>

-(void)triedToCreateRetweetRaffleWithMessage:(NSString *)message;

@end

@interface CreationRetweetViewController : UIViewController

@property (weak, nonatomic) id<RetweetCreationDelegate> delegate;

@property (weak, nonatomic) IBOutlet EmptyStateView *emptyStateView;

@end
