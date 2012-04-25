//
//  StatsViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 12/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()

@end

@implementation StatsViewController
@synthesize rankImageView;
@synthesize statsScrollView;
@synthesize scoreLabel;
@synthesize killsLabel;
@synthesize deathsLabel;
@synthesize killDeathRatioLabel;
@synthesize expRemainingLabel;
@synthesize URLToUse;
@synthesize accuracyLabel;
@synthesize rankProgressView;

@synthesize winloseRatioLabel;
@synthesize spmLabel;
@synthesize label;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize label6;
@synthesize label7;
@synthesize longestHeadshot;
@synthesize label8;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    bool isSetUp = [defaults boolForKey:@"setup"];

    if (isSetUp) {
        float accuracy = [defaults floatForKey:@"accuracy"];
        float wlRatio = [defaults floatForKey:@"wlratio"];
        int remaining = [defaults integerForKey:@"remaining"];
        float score = [defaults floatForKey:@"score"];
        float kills = [defaults floatForKey:@"kills"];
        float deaths = [defaults floatForKey:@"deaths"];
        float kdr = [defaults floatForKey:@"kdr"];
        NSString *imagePath = [defaults objectForKey:@"imagepath"];
        imagePath = [imagePath stringByReplacingOccurrencesOfString:@"rankslarge/" withString:@"rank"];
        float percentageComplete = [defaults floatForKey:@"percentage"];
        float scorePerMinute = [defaults floatForKey:@"scoreperminute"];
        float longesths = [defaults floatForKey:@"longestheadshot"];

        self.rankProgressView = [[ADVPopoverProgressBar alloc] initWithFrame:CGRectMake(0, 180, 320, 30) andProgressBarColor:ADVProgressBarBlue];     
        [rankProgressView setProgress:percentageComplete];
        
        [self.view addSubview:rankProgressView];
        
        spmLabel.text = [NSString stringWithFormat:@"%.2f", scorePerMinute];
        longestHeadshot.text = [NSString stringWithFormat:@"%.2f", longesths];
        self.navigationItem.title = [defaults objectForKey:@"name"];
        rankImageView.image = [UIImage imageNamed:imagePath];
        scoreLabel.text = [NSString stringWithFormat:@"%.0f", score];
        killsLabel.text = [NSString stringWithFormat:@"%.0f", kills];
        deathsLabel.text = [NSString stringWithFormat:@"%.0f", deaths];
        killDeathRatioLabel.text = [NSString stringWithFormat:@"%.3f", kdr];
        expRemainingLabel.text = [NSString stringWithFormat:@"%i", remaining];
        accuracyLabel.text = [NSString stringWithFormat:@"%.2f% %", accuracy];
        winloseRatioLabel.text = [NSString stringWithFormat:@"%.2f", wlRatio];


        [statsScrollView setScrollEnabled:YES];
        [statsScrollView setContentSize:CGSizeMake(320, 240)];
    }

    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oh oh!"
                                                          message:@"It doesn't look like you've set up stats yet."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];

        [message show];
        spmLabel.hidden = YES;
        rankImageView.hidden = YES;
        scoreLabel.hidden = YES;
        killsLabel.hidden = YES;
        deathsLabel.hidden = YES;
        killDeathRatioLabel.hidden = YES;
        expRemainingLabel.hidden = YES;
        accuracyLabel.hidden = YES;
        winloseRatioLabel.hidden = YES;
        rankProgressView.hidden = YES;
        label.hidden = YES;
        label2.hidden = YES;
        label3.hidden = YES;
        label4.hidden = YES;
        label5.hidden = YES;
        label6.hidden = YES;
        label7.hidden = YES;
        label8.hidden = YES;
        longestHeadshot.hidden = YES;
    }


    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    [self setRankImageView:nil];
    [self setStatsScrollView:nil];
    [self setScoreLabel:nil];
    [self setKillsLabel:nil];
    [self setDeathsLabel:nil];
    [self setKillDeathRatioLabel:nil];
    [self setExpRemainingLabel:nil];
    [self setAccuracyLabel:nil];
    [self setWinloseRatioLabel:nil];
    [self setStatsScrollView:nil];
    [self setSpmLabel:nil];
    [self setLabel:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [self setLabel5:nil];
    [self setLabel6:nil];
    [self setLabel7:nil];
    [self setLongestHeadshot:nil];
    [self setLabel8:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
