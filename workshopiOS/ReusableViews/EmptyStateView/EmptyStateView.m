//
//  EmptyStateView.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-26.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "EmptyStateView.h"

@implementation EmptyStateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - init methods

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    // load view frame XIB
        [self commonSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

#pragma mark - setup view

- (UIView *)loadViewFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    //  An exception will be thrown if the xib file with this class name not found,
    UIView *view = [[bundle loadNibNamed:NSStringFromClass([self class])  owner:self options:nil] firstObject];
    return view;
}

- (void)commonSetup {
    UIView *nibView = [self loadViewFromNib];
    nibView.frame = self.bounds;
    
    // the autoresizingMask will be converted to constraints, the frame will match the parent view frame
    nibView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Adding nibView on the top of our view
    [self addSubview:nibView];
}

#pragma mark - Setting methods

-(void)setEmptyStateMessageWithString:(NSString *)message {
    self.message = message;
}

@end
