//
//  RibbonsTableController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RibbonsTableController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSDictionary *ribbons;
    NSString *ribbonnametemp;
}
@end