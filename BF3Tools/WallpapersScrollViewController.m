//
//  WallpapersScrollViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WallpapersScrollViewController.h"
#import "WallpaperDetailViewController.h"

@implementation WallpapersScrollViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Passes imagetoload to the DetailViewController
    if ([segue.identifier isEqualToString:@"WallpaperDetailSegue"]) {
        WallpaperDetailViewController *DetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WallpaperDetail"];
        DetailViewController = [segue destinationViewController];
        DetailViewController.imagetoload = imagetoload;
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
    [wallpaperScrollView setScrollEnabled:YES];
    [wallpaperScrollView setContentSize:CGSizeMake(320, 850)];
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

- (IBAction)wall1Pressed {
    imagetoload = @"Wall1.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
    
}

- (IBAction)wall2Pressed {
    imagetoload = @"Wall2.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall3Pressed {
    imagetoload = @"Wall3.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall4Pressed {
    imagetoload = @"Wall4.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall5Pressed {
    imagetoload = @"Wall5.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall6Pressed {
    imagetoload = @"Wall6.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall7Pressed {
    imagetoload = @"Wall7.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

- (IBAction)wall8Pressed {
    imagetoload = @"Wall8.png";
    [self performSegueWithIdentifier:@"WallpaperDetailSegue" sender:self];
}

@end
