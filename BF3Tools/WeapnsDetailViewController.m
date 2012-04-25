//
//  DetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 21/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WeapnsDetailViewController.h"


@implementation WeapnsDetailViewController

@synthesize navbartitle, weaponimagetoload, weapondescriptiontoload, weaponstatstoload, weapondescription, detailsorstats;
#pragma mark - Managing the detail item



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (IBAction)segmentedControlIndexChanged {
    switch (self.detailsorstats.selectedSegmentIndex) {
        case 0:
            weapondescription.text = weapondescriptiontoload;
            weaponimage.hidden = NO;
            weapondescription.hidden = NO;
            videosView.hidden = YES;
            break;
        case 1:
            weapondescription.text = weaponstatstoload;
            weaponimage.hidden = NO;
            weapondescription.hidden = NO;
            videosView.hidden = YES;
            break;
        case 2:
            weaponimage.hidden = YES;
            weapondescription.hidden = YES;
            videosView.hidden = NO;
            [videosView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: videosURL]]];
            NSLog(@"derp");
        default:
            break;

    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackTranslucent];
    self.navigationItem.title = navbartitle;
    weapondescription.text = weapondescriptiontoload;
    weapondescription.font = [UIFont fontWithName:@"Helvetica" size:14];
    weaponimage.image = [UIImage imageNamed:weaponimagetoload];
    [videosView setDelegate:self];
    videosURL = [NSString stringWithFormat:@"%@%@%@", @"http://m.youtube.com/results?q=", [navbartitle stringByReplacingOccurrencesOfString:@" " withString:@"%20"], @"%20battlefield%203"]; 
   	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void) showWeaponImageModally:(UITapGestureRecognizer *) recognizer {
    [self.navigationController setNavigationBarHidden:![self.navigationController isNavigationBarHidden] animated:YES];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // finished loading, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error Loading"
                                                      message:@"You must be connected to the Internet to view Internet content."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
}


@end
