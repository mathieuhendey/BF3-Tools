//
//  MedalsTableController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 29/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedalsTableController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSDictionary *medals;
    NSString *medalnametemp;
}
@end

