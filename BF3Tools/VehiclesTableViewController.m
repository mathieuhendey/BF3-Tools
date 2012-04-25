//
//  VehiclesTableViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VehiclesTableViewController.h"
#import "VehiclesDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MasterCell.h"



@implementation VehiclesTableViewController
@synthesize vehicles, vehiclename, vehicledetails;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"VehiclesDetailViewSegue"]) {
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSString *cellText = selectedCell.textLabel.text;
        NSString *vehicleimagetobeloaded = [NSString stringWithFormat:@"%@.png", cellText];
        VehiclesDetailViewController *VehiclesDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeaponsDetail"];
        VehiclesDetailViewController = [segue destinationViewController];
        VehiclesDetailViewController.vehiclenametoload = cellText;
        NSString *vehicledetailstext = [[self.vehicledetails valueForKey:cellText] objectAtIndex:0];
        VehiclesDetailViewController.vehicledescriptiontoload = vehicledetailstext;
        VehiclesDetailViewController.vehicleimagetoload = vehicleimagetobeloaded;
        
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    vehicles = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicles" ofType:@"plist"]];
    vehicledetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehiclesdetails" ofType:@"plist"]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.vehicles allKeys] objectAtIndex:section];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [self.vehicles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *vehicletype = [self tableView:tableView titleForHeaderInSection:section];
	return [[self.vehicles valueForKey:vehicletype] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"VehicleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *vehicletype = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    vehiclename = [[self.vehicles valueForKey:vehicletype] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = vehiclename;
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"VehiclesDetailViewSegue" sender:self];
}

@end
