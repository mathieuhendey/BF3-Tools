//
//  WallpaperDetailViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WallpaperDetailViewController.h"

@implementation WallpaperDetailViewController
@synthesize imagetoload;

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

- (IBAction)doneButtonPressed {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {  
    if (error) { 
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error Saving Image"
                                                          message:@"There was an error saving the image to Photo Album."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        
    } else {  UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                message:@"Image saved to Photo Album."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
        [message show];
        
        
    }  
    
}

- (IBAction)saveButtonPressed {
    UIImageWriteToSavedPhotosAlbum([UIImage imageNamed:imagetoload], self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);  

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
    wallpaper.image = [UIImage imageNamed:imagetoload];
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
