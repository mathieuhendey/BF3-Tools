//
//  AssignmentDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentDetailViewController : UIViewController {
    IBOutlet UILabel *assignmentname;
    IBOutlet UILabel *assignmentrequirements;
    IBOutlet UIImageView *assignmentimage;
    NSString *imagetoload;
    NSString *requirements;
    NSString *assignmentnamestring;
    
}
@property (nonatomic, strong) NSString *imagetoload;
@property (nonatomic, strong) NSString *assignmentnamestring;
@property (nonatomic, strong) NSString *requirements;

@end
