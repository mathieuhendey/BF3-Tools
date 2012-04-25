//
//  WeaponsChartDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 31/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaponsChartDetailViewController : UIViewController {
    IBOutlet UIImageView *weaponimage;
    NSString *chartToLoad;
    NSString *navbartitle;
    IBOutlet UISegmentedControl *accuracyordamage;
    IBOutlet UIImageView *headers;
    
}

- (IBAction)segmentedControlIndexChanged;
@property (nonatomic, retain) NSString *chartToLoad;
@property (nonatomic, retain) NSString *navbartitle;
@end

