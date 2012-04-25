//
//  WeaponsTableViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WeaponsTableViewController.h"
#import "WeapnsDetailViewController.h"

@implementation WeaponsTableViewController
@synthesize weapons, weaponsdetails, weaponname;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"WeaponsDetailViewSegue"]) {
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSString *cellText = selectedCell.textLabel.text;
        NSString *weaponimagetobeloaded = [NSString stringWithFormat:@"%@.png", cellText];
        WeapnsDetailViewController *WeaponsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeaponsDetail"];
        WeaponsDetailViewController = [segue destinationViewController];
        WeaponsDetailViewController.navbartitle = cellText;
        weaponname = [NSString stringWithFormat:@"%i", [[self.tableView indexPathForSelectedRow] row]];
        NSString *weapondetailstext = [[self.weaponsdetails valueForKey:cellText] objectAtIndex:0];
        NSString *weaponstatstext = [[self.weaponsdetails valueForKey:cellText] objectAtIndex:1];
        WeaponsDetailViewController.weapondescriptiontoload = weapondetailstext;
        WeaponsDetailViewController.weaponstatstoload = weaponstatstext;
        WeaponsDetailViewController.weaponimagetoload = weaponimagetobeloaded;
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
    weapons = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weapons" ofType:@"plist"]];
    weaponsdetails = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponsdetails" ofType:@"plist"]];

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
    return [[self.weapons allKeys] objectAtIndex:section];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.weapons count] ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *weapontype = [self tableView:tableView titleForHeaderInSection:section];
	return [[self.weapons valueForKey:weapontype] count];}

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
    [self performSegueWithIdentifier:@"WeaponsDetailViewSegue" sender:self];
   

}

@end
