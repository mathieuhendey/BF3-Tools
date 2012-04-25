//
//  DogtagTableviewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 25/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MedalsTableController.h"
#import "MedalDetailViewController.h"

@implementation MedalsTableController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MedalDetailViewSegue"]) {
        MedalDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MedalDetail"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.medalnamestring = [NSString stringWithFormat:@"%@", [[medals valueForKey:medalnametemp] objectAtIndex:0]];
        DetailViewController.requirements = [NSString stringWithFormat:@"%@", [[medals valueForKey:medalnametemp] objectAtIndex:2]];
        DetailViewController.imagetoload = [NSString stringWithFormat:@"%@", [[medals valueForKey:medalnametemp] objectAtIndex:1]];
        
    }
    
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
- (void)viewDidLoad
{
    [super viewDidLoad];
    medals = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Medals" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [medals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MedalCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    medalnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    NSString *medalname = [[medals valueForKey:medalnametemp] objectAtIndex:0];
    NSString *medalimagename = [[medals valueForKey:medalnametemp] objectAtIndex:1];
    NSString *medalrequirements = [[medals valueForKey:medalnametemp] objectAtIndex:2];
    
    UILabel *medalnamelabel = (UILabel *)[cell viewWithTag:100];
    medalnamelabel.text = medalname;
    UILabel *medalrequirementslabel = (UILabel *)[cell viewWithTag:101];
    medalrequirementslabel.text = medalrequirements;
    UIImageView *medalimageoncell = (UIImageView *)[cell viewWithTag:200];
    medalimageoncell.image = [UIImage imageNamed:medalimagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    medalnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"MedalDetailViewSegue" sender:self];
    
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

@end
