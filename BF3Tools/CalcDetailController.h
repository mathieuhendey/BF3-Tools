//
//  DetailController.h
//  bulletdropcalculator
//
//  Created by Mathieu Hendey on 03/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CalcDetailController;

@protocol ModalViewDelegate <NSObject>

- (void) detailControllerDidPressDone: (CalcDetailController *) controller: (NSString *) message;

@end

@interface CalcDetailController : UITableViewController {
    
    NSDictionary *weaponsDict;
    NSString *weaponName;
}

@property (nonatomic, retain) NSDictionary *weaponsDict;
@property (nonatomic, retain) NSString *weaponName;
@property (nonatomic, weak) id <ModalViewDelegate> delegate;

- (IBAction)closeButtonTapped;

@end
