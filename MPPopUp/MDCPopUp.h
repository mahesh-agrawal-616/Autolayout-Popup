//
//  MDCPopUp.h
//  MDConnect
//
//  Created by Custom Apps on 9/12/16.
//  Copyright © 2016 Custom Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCPopUp : UIView

@property (weak, nonatomic) IBOutlet UITextView *txtQues;

@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

@property (strong, nonatomic) UIView *overlay;

@property(nonatomic,retain) NSArray* nib;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;

- (void)showAnimate;

- (void)removeAnimate;

- (IBAction)btnCloseClicked:(id)sender;

- (IBAction)btnSubmitClicked:(id)sender;

@end
