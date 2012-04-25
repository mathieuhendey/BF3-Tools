//
//  MedalDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 29/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedalDetailViewController : UIViewController {
    IBOutlet UILabel *medalname;
    IBOutlet UILabel *medalrequirements;
    IBOutlet UIImageView *medalimage;
    NSString *imagetoload;
    NSString *requirements;
    NSString *medalnamestring;
    
}
@property (nonatomic, strong) NSString *imagetoload;
@property (nonatomic, strong) NSString *medalnamestring;
@property (nonatomic, strong) NSString *requirements;

@end