//
//  WeaponsStatsDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaponsStatsDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *killsLabel;
@property (weak, nonatomic) IBOutlet UILabel *headshotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weaponImage;

@property(nonatomic, retain) NSString *weaponimagetoload;
@property(nonatomic, retain) NSString *navbartitle;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UITableView *statsTable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statsUnlocksSegmentedController;

@property (weak, nonatomic) IBOutlet UIScrollView *statsScrollView;
- (IBAction)segmentChanged:(id)sender;
@end
