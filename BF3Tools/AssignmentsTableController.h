//
//  AssignmentsTableController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentsTableController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSDictionary *assignments;
    NSString *assignmentnametemp;
}
@end
