//
//  AssignmentsTableController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AssignmentsTableController.h"
#import "AssignmentDetailViewController.h"

@implementation AssignmentsTableController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //passes necessary information to DetailViewController
    
    if ([segue.identifier isEqualToString:@"AssignmentDetailViewSegue"]) {
        AssignmentDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AssignmentsDetails"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.assignmentnamestring = [NSString stringWithFormat:@"%@", [[assignments valueForKey:assignmentnametemp] objectAtIndex:0]];
        DetailViewController.requirements = [NSString stringWithFormat:@"%@", [[assignments valueForKey:assignmentnametemp] objectAtIndex:2]];
        DetailViewController.imagetoload = [NSString stringWithFormat:@"%@", [[assignments valueForKey:assignmentnametemp] objectAtIndex:1]];
        
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
    //Fills dictionary with contents of plist
    assignments = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Assignments" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [assignments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssignmentCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    assignmentnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    NSString *assignmentname = [[assignments valueForKey:assignmentnametemp] objectAtIndex:0];
    NSString *assignmentimagename = [[assignments valueForKey:assignmentnametemp] objectAtIndex:1];
    NSString *assignmentrequirements = [[assignments valueForKey:assignmentnametemp] objectAtIndex:2];
    UILabel *assignmentnamelabel = (UILabel *)[cell viewWithTag:100];
    assignmentnamelabel.text = assignmentname;
    UILabel *assignmentrequirementslabel = (UILabel *)[cell viewWithTag:101];
    assignmentrequirementslabel.text = assignmentrequirements;
    UIImageView *assignmentimageoncell = (UIImageView *)[cell viewWithTag:200];
    assignmentimageoncell.image = [UIImage imageNamed:assignmentimagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    assignmentnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"AssignmentDetailViewSegue" sender:self];
    
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