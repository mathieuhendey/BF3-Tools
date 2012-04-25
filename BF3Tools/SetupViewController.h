//
//  SetupViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 12/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UISegmentedControl *platformSegment;
@property (weak, nonatomic) IBOutlet UITextField *gamertagField;
@property (retain, nonatomic) NSString *platform;
@property (retain, nonatomic) NSString *gamertag;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (retain, nonatomic) UIActivityIndicatorView *activityIndicator;
- (IBAction)updateButtonPressed:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@end
