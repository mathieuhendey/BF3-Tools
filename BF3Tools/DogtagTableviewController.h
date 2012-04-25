//
//  DogtagTableviewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 25/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DogtagTableviewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSDictionary *rankdogtags;
    NSString *dogtagnametemp;
}
@end
