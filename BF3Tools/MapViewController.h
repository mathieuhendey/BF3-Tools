//
//  DetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 21/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <UIScrollViewDelegate> {
    NSNumber *detailItem;
    
    IBOutlet UIImageView *mapImageView;
    IBOutlet UIScrollView *scroll;
    NSString *navbartitle;
    NSString *imagetoload;
}
@property (nonatomic, strong) IBOutlet UIImageView *mapImageView;
@property (nonatomic, strong) IBOutlet UIScrollView *scroll;
@property (nonatomic, strong) NSString *imagetoload;
@property (nonatomic, strong) NSString *navbartitle;
@end
