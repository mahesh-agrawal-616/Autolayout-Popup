//
//  MDCPopUp.m
//  MDConnect
//
//  Created by Custom Apps on 9/12/16.
//  Copyright © 2016 Custom Apps. All rights reserved.
//

#import "MDCPopUp.h"

@implementation MDCPopUp

- (id)init {
    self = [super init];
    
    if (self) {
        _nib = [[NSBundle mainBundle] loadNibNamed:@"MDCPopUp" owner:self options:nil];
        self = [_nib objectAtIndex:0];
       
        self.layer.cornerRadius = 5;
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        _txtQues.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    
    return self;
}

- (void)showAnimate
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removeAnimate
{
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            [_overlay removeFromSuperview];
        }
    }];
}

- (IBAction)btnCloseClicked:(id)sender {
     [self removeAnimate];
}

- (IBAction)btnSubmitClicked:(id)sender {

}

- (void)showInView:(UIView *)aView animated:(BOOL)animated
{
    [aView addSubview:self];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:290.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:247.0]];
    
    [aView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [aView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [aView layoutIfNeeded];
    
    if (animated) {
        [self showAnimate];
    }
}

@end
