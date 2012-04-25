//
//  RankDetailViewController.h
//  BF3Tools
//
//  Created by Mathieu Hendey on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankDetailViewController : UIViewController {
    IBOutlet UILabel *dogtagname;
    IBOutlet UILabel *dogtagrequirements;
    IBOutlet UIImageView *dogtagimage;
    NSString *imagetoload;
    NSString *requirements;
    NSString *dogtagnamestring;
    
}
@property (nonatomic, strong) NSString *imagetoload;
@property (nonatomic, strong) NSString *dogtagnamestring;
@property (nonatomic, strong) NSString *requirements;
@end
