//
//  RibbonDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RibbonDetailViewController : UIViewController {
    IBOutlet UILabel *ribbonname;
    IBOutlet UILabel *ribbonrequirements;
    IBOutlet UIImageView *ribbonimage;
    NSString *imagetoload;
    NSString *requirements;
    NSString *ribbonnamestring;
    
}
@property (nonatomic, strong) NSString *imagetoload;
@property (nonatomic, strong) NSString *ribbonnamestring;
@property (nonatomic, strong) NSString *requirements;

@end
