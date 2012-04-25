//
//  StatsViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 12/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVPopoverProgressBar.h"


@interface StatsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *rankImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *statsScrollView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *killsLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathsLabel;
@property (weak, nonatomic) IBOutlet UILabel *killDeathRatioLabel;
@property (weak, nonatomic) IBOutlet UILabel *expRemainingLabel;
@property (retain, nonatomic) NSURL *URLToUse;
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (nonatomic, strong) ADVPopoverProgressBar *rankProgressView;
@property (weak, nonatomic) IBOutlet UILabel *winloseRatioLabel;
@property (weak, nonatomic) IBOutlet UILabel *spmLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *longestHeadshot;
@property (weak, nonatomic) IBOutlet UILabel *label8;

@end
