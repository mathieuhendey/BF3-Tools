//
//  WeaponsChartDetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 31/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeaponsChartDetailViewController.h"


@interface WeaponsChartDetailViewController ()

@end

@implementation WeaponsChartDetailViewController
@synthesize chartToLoad, navbartitle;

- (IBAction)segmentedControlIndexChanged {
    switch (accuracyordamage.selectedSegmentIndex) {
        case 0:
            weaponimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-chart.png", chartToLoad]];
            headers.hidden = YES;
            break;
        case 1:
             weaponimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-chart1.png", chartToLoad]];
            headers.hidden=NO;
        default:
            break;
    }
}

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
    [super viewDidLoad];
    weaponimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-chart.png", chartToLoad]];
    self.navigationItem.title = navbartitle;
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
