//
//  VideoViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 27/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"


@implementation VideoViewController
#import "VideoViewController.h"

@synthesize webView;

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//        
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.youtube.com/index?desktop_uri=%2F&gl=GB#/profile?user=Battlefield"]]];
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // release and set to nil
    self.webView = nil;
}

- (void) viewDidAppear:(BOOL)animated {
    //Because there are no controls with the WebView, reset address to YouTube everytime the view loads, in case the user has drilled down somewhere they cannot return from in the webview
       [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.youtube.com/index?desktop_uri=%2F&gl=GB#/profile?user=Battlefield"]]];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.webView.delegate = self; // setup the delegate as the web view is shown
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.webView stopLoading];   // in case the web view is still loading its content
    self.webView.delegate = nil;  // disconnect the delegate as the webView is hidden
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void) viewDidDisappear:(BOOL)animated {
    //sets messagewasshow to NO so if user loses Internet connection whilst app is open, error message is still shown.
    
    messageWasShown = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // we support rotation in this view controller
    return YES;
}

// this helps dismiss the keyboard when the "Done" button is clicked
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[textField text]]]];
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // finished loading, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    messageWasShown = YES;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
     // Display alert with message if Internet connection is offline   
    if (messageWasShown == NO) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error Loading"
                                                          message:@"You must be connected to the Internet to view videos."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        messageWasShown = YES;
    }
    
        
}


@end