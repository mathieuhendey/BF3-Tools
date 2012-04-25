//
//  InternetMenuController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 27/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InternetMenuController.h"
#import "InternetWebViewController.h"

@implementation InternetMenuController


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WebViewSegue"]) {
        InternetWebViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ClassesDetail"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.URLtoload = URLtoload;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)TwitterButtonPressed {
    URLtoload = @"http://mobile.twitter.com/battlefield/tweets";
    [self performSegueWithIdentifier:@"WebViewSegue" sender:self];
}
- (IBAction)BattlelogButtonPressed {
    URLtoload = @"http://battlelog.battlefield.com";
    [self performSegueWithIdentifier:@"WebViewSegue" sender:self];

}
- (IBAction)RedditButtonPressed {
    URLtoload = @"http://i.reddit.com/r/battlefield3";
    [self performSegueWithIdentifier:@"WebViewSegue" sender:self];

}
- (IBAction)BlogButtonPressed {
    URLtoload = @"http://blogs.battlefield.ea.com/Default.aspx##";
    [self performSegueWithIdentifier:@"WebViewSegue" sender:self];

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
