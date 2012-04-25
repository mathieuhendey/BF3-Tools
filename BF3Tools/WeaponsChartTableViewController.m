//
//  WeaponsChartTableViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeaponsChartTableViewController.h"
#import "WeaponsChartDetailViewController.h"

@interface WeaponsChartTableViewController ()

@end

@implementation WeaponsChartTableViewController
@synthesize imageString, weapons, weaponname;


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"WeaponsChartDetailViewSegue"]) {
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSString *cellText = selectedCell.textLabel.text;
        NSString *weaponimagetobeloaded = [NSString stringWithFormat:@"%@", cellText];
        WeaponsChartDetailViewController *WeaponsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeaponsChartDetail"];
        WeaponsDetailViewController = [segue destinationViewController];
        WeaponsDetailViewController.navbartitle = cellText;
        WeaponsDetailViewController.chartToLoad = weaponimagetobeloaded;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    weapons = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponcharts" ofType:@"plist"]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.weapons count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.weapons allKeys] objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *weapontype = [self tableView:tableView titleForHeaderInSection:section];
	return [[self.weapons valueForKey:weapontype] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WeaponCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *weapontype = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    weaponname = [[self.weapons valueForKey:weapontype] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = weaponname;
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"WeaponsChartDetailViewSegue" sender:self];
}

@end
