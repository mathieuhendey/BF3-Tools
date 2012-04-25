//
//  WallpapersScrollViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 30/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpapersScrollViewController : UIViewController {
    IBOutlet UIScrollView *wallpaperScrollView;
    NSString *imagetoload;
    
}

- (IBAction)wall1Pressed;
- (IBAction)wall2Pressed;
- (IBAction)wall3Pressed;
- (IBAction)wall4Pressed;
- (IBAction)wall5Pressed;
- (IBAction)wall6Pressed;
- (IBAction)wall7Pressed;
- (IBAction)wall8Pressed;

@end
