//
//  VehiclesTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehiclesTableViewController : UITableViewController {
    NSDictionary *vehicles;
    NSDictionary *vehicledetails;
    NSString *vehiclename;
}

@property (nonatomic, strong) NSDictionary *vehicles;
@property (nonatomic, strong) NSDictionary *vehicledetails;
@property (nonatomic, strong) NSString *vehiclename;
@end
