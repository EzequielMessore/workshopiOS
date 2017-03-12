//
//  PersonTableViewCell.m
//  WorkshopObjC
//
//  Created by Yasmin Benatti on 2017-02-19.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "Constants.h"
#import "AppUtils.h"

@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        reuseID = reuseIdentifier;
        
        [self setUpPersonImageView];
        [self setUpNameLabel];
        [self setUpSeparatorView];
    }
    
    return self;
}

#pragma mark - Content Setup

-(PersonTableViewCell *)fillUpCellWithPerson:(Person *)person {
    [self.personNameLabel setText:person.name];
    [AppUtils setupImageWithUrl:person.picture andPlaceholder:@"" andImageView:self.personImageView];
    
    return self;
}

#pragma mark - Layout Setup

-(void)setUpPersonImageView {
    self.personImageView = [UIImageView new];
    self.personImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.personImageView];
    
    
    //Height Constraint
    [self.personImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.personImageView
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:36.0f]];
    
    //Width Constraint
    [self.personImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.personImageView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:36.0f]];
    
    //Center Image on Cell
    NSLayoutConstraint *personImageViewCenterYConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.personImageView attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                      attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0f];
    
    //Leading (left) Constraint
    NSLayoutConstraint *personImageViewLeadingConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.personImageView attribute:NSLayoutAttributeLeading
                                                 relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:16.0f];

    
    [self.contentView addConstraints:@[personImageViewLeadingConstraint, personImageViewCenterYConstraint]];
    
    //Rounded Borders
    [self.personImageView.layer setCornerRadius:18.0f];
    [self.personImageView.layer setMasksToBounds:YES];
    [self.personImageView setBackgroundColor:COLOR_TULIPE];
}

-(void)setUpNameLabel {
    self.personNameLabel = [UILabel new];
    self.personNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.personNameLabel setBackgroundColor:[UIColor clearColor]];
    [self.personNameLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:16.0f]];
    [self.personNameLabel setTextColor:COLOR_CHARCOAL];
    [self.personNameLabel setNumberOfLines:1];
    [self.contentView addSubview:self.personNameLabel];
    
    //Center Name on Image
    NSLayoutConstraint *nameLabelCenterYConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.personNameLabel attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual toItem:self.personImageView
                                                      attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0f];
    
    //Trailing (right) Constraint
    NSLayoutConstraint *nameLabelTrailingConstraint = [NSLayoutConstraint
                                                       constraintWithItem:self.personNameLabel attribute:NSLayoutAttributeTrailing
                                                       relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                       attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-16.0f];
    
    //Leading (left) Constraint to PersonImageView
    NSLayoutConstraint *nameLabelLeadingConstraint = [NSLayoutConstraint
                                                      constraintWithItem:self.personNameLabel attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationEqual toItem:self.personImageView
                                                      attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:8.0f];
    
    [self.contentView addConstraints:@[nameLabelCenterYConstraint, nameLabelTrailingConstraint, nameLabelLeadingConstraint]];
}

-(void)setUpSeparatorView {
    self.separatorView = [UIView new];
    self.separatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.separatorView setBackgroundColor:COLOR_CHARCOAL_20];
    [self.contentView addSubview:self.separatorView];
    
    [self.separatorView addConstraint:[NSLayoutConstraint constraintWithItem:self.separatorView
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:0.5f]];
    
    
    NSLayoutConstraint *separatorViewBottomConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.separatorView attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                         attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *separatorViewLeadingConstraint = [NSLayoutConstraint
                                                          constraintWithItem:self.separatorView attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                          attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *separatorViewTrailingConstraint = [NSLayoutConstraint
                                                           constraintWithItem:self.separatorView attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual toItem:self.contentView
                                                           attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0f];
    
    
    [self.contentView addConstraints:@[separatorViewBottomConstraint, separatorViewLeadingConstraint, separatorViewTrailingConstraint]];
}

@end
