//
//  EmptyStateView.h
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE //Reusable Views loaded from a xib file, you can see them on storyboard

@interface EmptyStateView : UIView

@property (weak, nonatomic) IBOutlet UILabel *message;

@end
