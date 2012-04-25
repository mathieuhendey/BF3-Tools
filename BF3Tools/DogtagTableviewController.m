//
//  DogtagTableviewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 25/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DogtagTableviewController.h"
#import "RankDetailViewController.h"

@implementation DogtagTableviewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RankDetailViewSegue"]) {
        RankDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RanksDetails"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.dogtagnamestring = [NSString stringWithFormat:@"%@", [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:0]];
        DetailViewController.requirements = [NSString stringWithFormat:@"%@", [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:2]];
        DetailViewController.imagetoload = [NSString stringWithFormat:@"%@", [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:1]];
        
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
    rankdogtags = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"RankDogTags" ofType:@"plist"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [rankdogtags count];
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
    NSString *dogtagname = [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:0];
    NSString *dogtagimagename = [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:1];
    NSString *dogtagrequirements = [[rankdogtags valueForKey:dogtagnametemp] objectAtIndex:2];
    
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
    [self performSegueWithIdentifier:@"RankDetailViewSegue" sender:self];
    
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
