//
//  AwardsTableViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 13/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AwardsTableViewController.h"

@interface AwardsTableViewController ()

@end

@implementation AwardsTableViewController
@synthesize table;
@synthesize segmentedControlView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{ 
    
    switch (segmentedControlView.selectedSegmentIndex) {
        case 0:
            return [ribbons count];
            break;
        case 1:
            return [medals count];
            break;
        case 2:
            return [rankdogtags count];
            break;
        case 3:
            return [assignments count];
            break;
        }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"AwardCell";
    
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
    assignmentnamelabel.text = @"derp";
    UILabel *assignmentrequirementslabel = (UILabel *)[cell viewWithTag:101];
    assignmentrequirementslabel.text = assignmentrequirements;
    UIImageView *assignmentimageoncell = (UIImageView *)[cell viewWithTag:200];
    assignmentimageoncell.image = [UIImage imageNamed:assignmentimagename];
    return cell;
    
}

- (void)viewDidLoad
{
    
    rankdogtags = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"RankDogTags" ofType:@"plist"]];
    awarddogtags = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AwardDogTags" ofType:@"plist"]];
    ribbons = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Ribbons" ofType:@"plist"]];
    medals = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Medals" ofType:@"plist"]];
    assignments = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Assignments" ofType:@"plist"]];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setSegmentedControlView:nil];
    [self setTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)segmentChanged:(id)sender {
    [table reloadData];
    
}
@end
