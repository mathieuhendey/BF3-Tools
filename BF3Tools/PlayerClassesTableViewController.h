//
//  PlayerClassesTableViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 24/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerClassesTableViewController : UITableViewController {
    NSDictionary *classesdetails;
}
@property (nonatomic, strong) NSMutableArray *playerclasses;
@property (nonatomic, strong) NSDictionary *classesdetails;
@end
