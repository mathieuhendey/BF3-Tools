//
//  PlayerClassesDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerClassesDetailViewController : UIViewController {
    IBOutlet UITextView *classdescription;
    IBOutlet UIImageView *classimage;
    NSString *classimagetoload;
    NSString *classdetailstoload;
    NSString *navbartitle;
}
@property (nonatomic, strong) UITextView *classdescription;
@property (nonatomic, strong) UIImageView *classimage;
@property (nonatomic, strong) NSString *classimagetoload;
@property (nonatomic, strong) NSString *classdetailstoload;
@property (nonatomic, strong) NSString *navbartitle;
@end
