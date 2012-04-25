//
//  DetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 21/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

@synthesize mapImageView, scroll, imagetoload, navbartitle;
#pragma mark - Managing the detail item



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackTranslucent];
    self.navigationController.title = navbartitle;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideNavBar:)];
    [self.mapImageView addGestureRecognizer:tapGesture];
    
    mapImageView.image = [UIImage imageNamed:imagetoload];
    scroll.contentSize = mapImageView.frame.size;
	[scroll addSubview:mapImageView];
	scroll.minimumZoomScale = 1.0 ;
	scroll.maximumZoomScale = 4.0;
	scroll.delegate = self;
	scroll.zoomScale = 1.1;
	// Do any additional setup after loading the view, typically from a nib.

    
    
}

- (void) hideNavBar:(UITapGestureRecognizer *) recognizer {
    [self.navigationController setNavigationBarHidden:![self.navigationController isNavigationBarHidden] animated:YES];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return mapImageView;
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

@end
