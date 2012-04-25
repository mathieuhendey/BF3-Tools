//
//  InternetMenuController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 27/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InternetMenuController : UIViewController {
    NSString *URLtoload;
    
}

- (IBAction)TwitterButtonPressed;
- (IBAction)BattlelogButtonPressed;
- (IBAction)RedditButtonPressed;
- (IBAction)BlogButtonPressed;


@end
