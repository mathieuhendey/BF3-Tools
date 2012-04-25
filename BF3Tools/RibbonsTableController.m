//
//  RibbonsTableController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RibbonsTableController.h"
#import "RibbonDetailViewController.h"
@implementation RibbonsTableController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RibbonDetailViewSegue"]) {
        RibbonDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RibbonsDetails"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.ribbonnamestring = [NSString stringWithFormat:@"%@", [[ribbons valueForKey:ribbonnametemp] objectAtIndex:0]];
        DetailViewController.requirements = [NSString stringWithFormat:@"%@", [[ribbons valueForKey:ribbonnametemp] objectAtIndex:2]];
        DetailViewController.imagetoload = [NSString stringWithFormat:@"%@", [[ribbons valueForKey:ribbonnametemp] objectAtIndex:1]];
        
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
    ribbons = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Ribbons" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [ribbons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RibbonCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    ribbonnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    NSString *ribbonname = [[ribbons valueForKey:ribbonnametemp] objectAtIndex:0];
    NSString *ribbonimagename = [[ribbons valueForKey:ribbonnametemp] objectAtIndex:1];
    NSString *ribbonrequirements = [[ribbons valueForKey:ribbonnametemp] objectAtIndex:2];
    UILabel *ribbonnamelabel = (UILabel *)[cell viewWithTag:100];
    ribbonnamelabel.text = ribbonname;
    UILabel *ribbonrequirementslabel = (UILabel *)[cell viewWithTag:101];
    ribbonrequirementslabel.text = ribbonrequirements;
    UIImageView *ribbonimageoncell = (UIImageView *)[cell viewWithTag:200];
    ribbonimageoncell.image = [UIImage imageNamed:ribbonimagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ribbonnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"RibbonDetailViewSegue" sender:self];
    
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
