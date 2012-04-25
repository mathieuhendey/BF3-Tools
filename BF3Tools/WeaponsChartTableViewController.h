//
//  WeaponsChartTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaponsChartTableViewController : UITableViewController {
    NSDictionary *weapons;
    NSString *imageString;
    NSString *weaponname;
}
@property (nonatomic, strong) NSDictionary *weapons;
@property (nonatomic, strong) NSString *imageString;
@property (nonatomic, strong) NSString *weaponname;

@end
