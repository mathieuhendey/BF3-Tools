//
//  AwardsTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 13/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AwardsTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSDictionary *ribbons;
    NSString *ribbonnametemp;
    NSDictionary *rankdogtags;
    NSString *dogtagnametemp;
    NSDictionary *awarddogtags;
    NSDictionary *medals;
    NSString *medalnametemp;
    NSDictionary *assignments;
    NSString *assignmentnametemp;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlView;
- (IBAction)segmentChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
