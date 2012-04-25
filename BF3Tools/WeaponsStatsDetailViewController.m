//
//  WeaponsStatsDetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeaponsStatsDetailViewController.h"

@interface WeaponsStatsDetailViewController ()

@end

@implementation WeaponsStatsDetailViewController
@synthesize killsLabel;
@synthesize headshotsLabel;
@synthesize accuracyLabel;
@synthesize weaponImage;
@synthesize weaponimagetoload;
@synthesize navbartitle;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize statsTable;
@synthesize statsUnlocksSegmentedController;
@synthesize statsScrollView;


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


    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    bool isSetUp =  [defaults boolForKey:@"setup"];

    if (isSetUp) {
        NSDictionary * weaponsDetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponsdetails" ofType:@"plist"]];
        NSString *weaponName = [[weaponsDetails objectForKey:navbartitle] objectAtIndex:2];

        int kills = [defaults integerForKey:[NSString stringWithFormat:@"%@ kills", weaponName]];
        float shots = [defaults floatForKey:[NSString stringWithFormat:@"%@ shots", weaponName]];
        int headshots = [defaults integerForKey:[NSString stringWithFormat:@"%@ headshots", weaponName]];
        float hits = [defaults floatForKey:[NSString stringWithFormat:@"%@ hits", weaponName]];
        float accuracy = (hits/shots) * 100;

        killsLabel.text = [NSString stringWithFormat:@"%i", kills];
        headshotsLabel.text = [NSString stringWithFormat:@"%i", headshots];
        accuracyLabel.text = [NSString stringWithFormat:@"%.02f %", accuracy];


        weaponImage.image = [UIImage imageNamed:weaponimagetoload];
        self.navigationItem.title = navbartitle;
    }

    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oh oh!"
                                                          message:@"It doesn't look like you've set up stats yet."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];

        [message show];
        headshotsLabel.hidden = YES;
        killsLabel.hidden = YES;
        accuracyLabel.hidden = YES;
        label1.hidden = YES;
        label2.hidden = YES;
        label3.hidden = YES;

    }

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setKillsLabel:nil];
    [self setHeadshotsLabel:nil];
    [self setAccuracyLabel:nil];
    [self setWeaponImage:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setStatsTable:nil];
    [self setStatsUnlocksSegmentedController:nil];
    [self setStatsScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"derp");
    NSDictionary * weaponsDetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponsdetails" ofType:@"plist"]];
    NSString *weaponName = [[weaponsDetails objectForKey:navbartitle] objectAtIndex:2];
    
    return [defaults integerForKey:[NSString stringWithFormat:@"%@ numberofunlocks", weaponName]];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    static NSString *CellIdentifier = @"weaponUnlockCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...

    UIImageView *accessoryImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *current = (UILabel *)[cell viewWithTag:101];
    UILabel *needed = (UILabel *)[cell viewWithTag:102];
    UILabel *name = (UILabel *)[cell viewWithTag:103];

    NSDictionary * weaponsDetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponsdetails" ofType:@"plist"]];
    NSString *weaponName = [[weaponsDetails objectForKey:navbartitle] objectAtIndex:2];

    NSArray *unlocks = [defaults objectForKey:[NSString stringWithFormat:@"%@ unlocks", weaponName]];
    NSDictionary *unlockStats = [unlocks objectAtIndex: indexPath.row];

    name.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"name"]];
    accessoryImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [unlockStats objectForKey:@"id"]]];
    current.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"curr"]];
    needed.text = [NSString stringWithFormat:@"%@", [unlockStats objectForKey:@"needed"]];
    
    NSLog(@"cell");


    return cell;
}


- (IBAction)segmentChanged:(id)sender {

    switch (statsUnlocksSegmentedController.selectedSegmentIndex) {
        case 0:
            statsTable.hidden = YES;
            killsLabel.hidden = NO;
            headshotsLabel.hidden = NO;
            label1.hidden = NO;
            label2.hidden = NO;
            label3.hidden = NO;
            weaponImage.hidden = NO;
            killsLabel.hidden = NO;
            headshotsLabel.hidden = NO;
            accuracyLabel.hidden = NO;
            statsScrollView.hidden = NO;
            break;
        case 1:
            statsTable.hidden = NO;
            killsLabel.hidden = YES;
            headshotsLabel.hidden = YES;
            label1.hidden = YES;
            label2.hidden = YES;
            label3.hidden = YES;
            weaponImage.hidden = YES;
            accuracyLabel.hidden = YES;
            statsScrollView.hidden = YES;
            NSLog(@"table");
            break;

    }
}
@end
