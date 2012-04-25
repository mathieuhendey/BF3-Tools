//
//  VehicleStatsDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleStatsDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSString *vehicleName;
@property (nonatomic, retain) NSString *vehicleImageToLoad;
@property (weak, nonatomic) IBOutlet UILabel *killsLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *detailsScrollView;


@end
