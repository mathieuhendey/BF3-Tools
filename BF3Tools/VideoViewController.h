//
//  VideoViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 27/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VideoViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
    BOOL messageWasShown;
}
@property (nonatomic, strong) UIWebView *webView;
@end
