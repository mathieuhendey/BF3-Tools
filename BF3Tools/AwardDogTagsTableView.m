//
//  AwardDogTagsTableView.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AwardDogTagsTableView.h"
#import "AwardDetailViewController.h"

@implementation AwardDogTagsTableView
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AwardDetailViewSegue"]) {
        AwardDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AwardsDetails"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.dogtagnamestring = [NSString stringWithFormat:@"%@", [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:0]];
        DetailViewController.requirements = [NSString stringWithFormat:@"%@", [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:2]];
        DetailViewController.imagetoload = [NSString stringWithFormat:@"%@", [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:1]];
                                             
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
    awarddogtags = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AwardDogTags" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [awarddogtags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DogtagCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    dogtagnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    NSString *dogtagname = [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:0];
    NSString *dogtagimagename = [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:1];
    NSString *dogtagrequirements = [[awarddogtags valueForKey:dogtagnametemp] objectAtIndex:2];
    UILabel *dogtagnamelabel = (UILabel *)[cell viewWithTag:100];
    dogtagnamelabel.text = dogtagname;
    UILabel *dogtagrequirementslabel = (UILabel *)[cell viewWithTag:101];
    dogtagrequirementslabel.text = dogtagrequirements;
    UIImageView *dogtagimageoncell = (UIImageView *)[cell viewWithTag:200];
    dogtagimageoncell.image = [UIImage imageNamed:dogtagimagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    dogtagnametemp = [NSString stringWithFormat:@"Item %i", indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"AwardDetailViewSegue" sender:self];
    
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