//
//  VehiclesStatsTableViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VehicleStatsDetailViewController.h"
#import "VehiclesStatsTableViewController.h"

@interface VehiclesStatsTableViewController ()

@end

@implementation VehiclesStatsTableViewController
@synthesize vehicles, vehiclename, vehicledetails;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"VehicleStatsDetailViewSegue"]) {

        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSString *cellText = selectedCell.textLabel.text;
        VehicleStatsDetailViewController *VehicleStatsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vehicleStatsDetail"];
        VehicleStatsDetailViewController = [segue destinationViewController];
        VehicleStatsDetailViewController.vehicleName = vehiclename;
        VehicleStatsDetailViewController.navigationItem.title = cellText;
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    vehicles = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];
    vehicledetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehiclesdetails" ofType:@"plist"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"derp");
    NSArray *vehicleIDs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];

    return [vehicleIDs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"VehicleCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"derp");

    NSArray *vehicleIDs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];

    NSString *currentVehicleName = [defaults objectForKey:[NSString stringWithFormat:@"%@ name", [vehicleIDs objectAtIndex:indexPath.row]]];
    vehiclename = [vehicleIDs objectAtIndex:indexPath.row];


    
    cell.textLabel.text = currentVehicleName;

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
    NSArray *vehicleIDs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];
    vehiclename = [vehicleIDs objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"VehicleStatsDetailViewSegue" sender:self];
}

@end
