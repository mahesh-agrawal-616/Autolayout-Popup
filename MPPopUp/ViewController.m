//
//  ViewController.m
//  MPPopUp
//
//  Created by Custom Apps on 9/13/16.
//  Copyright © 2016 Custom Apps. All rights reserved.
//

#import "ViewController.h"
#import "MDCPopUp.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MDCPopUp *mpop = [[MDCPopUp alloc] init];
    mpop.frame = CGRectMake(((self.view.frame.size.width) -
                             mpop.frame.size.width) / 2,
                            ((self.view.frame.size.height) -
                             mpop.frame.size.height) / 2,
                            mpop.frame.size.width,
                            mpop.frame.size.height);
    
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               self.view.frame.size.width,
                                                               self.view.frame.size.height)];
    
    mpop.overlay = newView;
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.backgroundColor = [UIColor blackColor];
    visualEffectView.alpha = 0.4;
    visualEffectView.frame = newView.bounds;
    
    //sequence matters keep a deep look....am adding the full screen view first.
    [self.view addSubview:newView];
    newView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    
    //then am adding the popup
    [newView addSubview:visualEffectView];
    visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:visualEffectView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:newView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:visualEffectView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:newView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:visualEffectView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:newView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:visualEffectView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:newView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    [self.view layoutIfNeeded];
    
    [mpop showInView:self.view animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
