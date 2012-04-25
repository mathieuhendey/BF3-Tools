//
//  WeaponsTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaponsStatsTableView : UITableViewController {
    NSDictionary *weapons;
    NSDictionary *weaponsdetails;
    NSString *weaponname;
}
@property (nonatomic, strong) NSDictionary *weapons;
@property (nonatomic, strong) NSDictionary *weaponsdetails;
@property (nonatomic, strong) NSString *weaponname;
@end