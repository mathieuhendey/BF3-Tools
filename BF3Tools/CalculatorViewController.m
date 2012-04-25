//
//  CalculatorViewController.m
//  bulletdropcalculator
//
//  Created by Mathieu Hendey on 03/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
@implementation CalculatorViewController
@synthesize milValue,targetSizeValue,rangeValue,adjustmentValue,dictionaryToLoad, scopeName
, gunNameLabel, scopeNameLabel, gravity, scopeValue, reportedUnits, mils, range, adjustment;

- (void) updateValues {
    // Update view to reflect updated gun/scope choice
    if ([scopeNameLabel.text isEqualToString:@"Rifle Scope"]) {
        scopeValue =  5.0;
    }
    if ([scopeNameLabel.text isEqualToString:@"PSK Scope"]) {
        scopeValue = 8.4;
    }
    if ([scopeNameLabel.text isEqualToString:@"Ballistic Scope"]) {
        scopeValue = 8.0;
    }
    if ([gunNameLabel.text isEqualToString:@"SV98"]) {
        gravity = 0.0181397929;
    }
    if ([gunNameLabel.text isEqualToString:@"M40"]) {
        gravity = 0.0204289879;
    }
    if ([gunNameLabel.text isEqualToString:@"L96"]) {
        gravity = 0.0168209877;
    }
    if ([gunNameLabel.text isEqualToString:@"M98"]) {
        gravity = 0.0116094675;
    }
    
    mils = reportedUnits * scopeValue;
    range = 1000.0*1.7/mils;
    adjustment = gravity*range / scopeValue;
    
    
    targetSizeValue.text = [NSString stringWithFormat:@"%.2f", reportedUnits];
    milValue.text = [NSString stringWithFormat:@"%.2f", mils];
    rangeValue.text = [NSString stringWithFormat:@"%.2f", range];
    adjustmentValue.text = [NSString stringWithFormat:@"%.2f", adjustment];
    
}

- (IBAction)addOneButtonPressed:(id)sender {
    reportedUnits++;
    [self updateValues];
}

- (IBAction)subOneButtonPressed:(id)sender {
    reportedUnits--;
    if (reportedUnits < 0)
        reportedUnits = 0;
    [self updateValues];
}

- (IBAction)subPointOneButtonPressed:(id)sender {
    reportedUnits = reportedUnits - 0.1;
    if (reportedUnits < 0)
        reportedUnits = 0;
    [self updateValues];
}

- (IBAction)addPointOneButtonPressed:(id)sender {
    reportedUnits = reportedUnits + 0.1;
    [self updateValues];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"weaponViewSegue"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        CalcDetailController *detailView = [[navigationController viewControllers] objectAtIndex:0];
        detailView.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"scopeViewSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ScopeTableViewController *detailView = [[navigationController viewControllers] objectAtIndex:0];
        detailView.delegate = self;
        
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}

#pragma mark - DetailViewDelegate

- (void) detailControllerDidPressDone:(CalcDetailController *)controller :(NSString *)message {
    gunNameLabel.text = message;
    [self dismissModalViewControllerAnimated:YES];
    [self updateValues];
}

- (void) scopeControllerDidPressDone:(ScopeTableViewController *)controller :(NSString *)message {
    scopeNameLabel.text = message;
    [self dismissModalViewControllerAnimated:YES];
    [self updateValues];
}

@end
