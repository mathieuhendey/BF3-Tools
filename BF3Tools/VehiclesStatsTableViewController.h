//
//  VehiclesStatsTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 14/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehiclesStatsTableViewController : UITableViewController {
NSDictionary *vehicles;
NSDictionary *vehicledetails;
NSString *vehiclename;
}
@property (nonatomic, strong) NSDictionary *vehicles;
@property (nonatomic, strong) NSDictionary *vehicledetails;
@property (nonatomic, strong) NSString *vehiclename;
@end
