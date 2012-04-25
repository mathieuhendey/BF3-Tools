//
//  WeapnsDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeapnsDetailViewController : UIViewController <UIWebViewDelegate> {
    NSString *navbartitle;
    NSString *weaponstatstoload;
    NSString *weapondescriptiontoload;
    NSString *weaponimagetoload;
    NSString *videosURL;
    IBOutlet UITextView *weapondescription;
    IBOutlet UIImageView *weaponimage;
    IBOutlet UISegmentedControl *detailsorstats;
    IBOutlet UIWebView *videosView;
}
@property (nonatomic, strong) NSString *navbartitle;
@property (nonatomic,strong) IBOutlet UITextView *weapondescription;
@property (nonatomic, strong) NSString *weaponstatstoload;
@property (nonatomic, strong) NSString *weapondescriptiontoload;
@property (nonatomic, strong) NSString *weaponimagetoload;
@property (nonatomic, strong) UISegmentedControl *detailsorstats;

- (IBAction)segmentedControlIndexChanged;
@end
