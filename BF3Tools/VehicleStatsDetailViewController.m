//
//  VehicleStatsDetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VehicleStatsDetailViewController.h"

@interface VehicleStatsDetailViewController ()

@end

@implementation VehicleStatsDetailViewController
@synthesize killsLabel;
@synthesize scoreLabel;
@synthesize detailsScrollView;
@synthesize vehicleImageToLoad, vehicleName;

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

    bool isSetUp =  [defaults boolForKey:@"setup"];

    if (isSetUp) {
        NSLog(@"derp");
        int numberOfKills = [defaults integerForKey:[NSString stringWithFormat:@"%@ kills", vehicleName]];
        killsLabel.text = [NSString stringWithFormat:@"%i", numberOfKills];
        scoreLabel.text = [NSString stringWithFormat:@"%i", [defaults integerForKey:[NSString stringWithFormat:@"%@ score", vehicleName]]];
    }

    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oh oh!"
                                                          message:@"It doesn't look like you've set up stats yet."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];

        [message show];
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload {

    [self setDetailsScrollView:nil];
    [self setKillsLabel:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *vehicleIDs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];
    return [vehicleIDs count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    static NSString *CellIdentifier = @"vehicleUnlockCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...

    UIImageView *accessoryImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *current = (UILabel *)[cell viewWithTag:101];
    UILabel *needed = (UILabel *)[cell viewWithTag:102];
    UILabel *name = (UILabel *)[cell viewWithTag:103];

    NSArray *unlocks = [defaults objectForKey:[NSString stringWithFormat:@"%@ unlocks", vehicleName]];

    NSDictionary *unlockStats = [unlocks objectAtIndex: indexPath.row];
    
    NSString *imageToLoad = [NSString stringWithFormat:@"%@.png", [unlockStats objectForKey:@"img"]];
    imageToLoad = [imageToLoad stringByReplacingOccurrencesOfString:@"vehicleunlocks/" withString:@""];
                             
    accessoryImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", imageToLoad]];
    current.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"curr"]];
    needed.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"needed"]];
    name.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"name"]];

    return cell;

}


@end
