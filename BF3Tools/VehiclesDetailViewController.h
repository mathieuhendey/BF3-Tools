//
//  VehiclesDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehiclesDetailViewController : UIViewController {
    IBOutlet UITextView *vehicledescription;
    IBOutlet UIImageView *vehicleimage;
    NSString *vehiclenametoload;
    NSString *vehicledescriptiontoload;
    NSString *vehicleimagetoload;
}
@property (nonatomic, strong) NSString *vehiclenametoload, *vehicledescriptiontoload, *vehicleimagetoload;
@end
