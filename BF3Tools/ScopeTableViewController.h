//
//  ScopeTableViewController.h
//  bulletdropcalculator
//
//  Created by Mathieu Hendey on 03/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScopeTableViewController;

@protocol ScopeViewDelegate <NSObject>

- (void) scopeControllerDidPressDone: (ScopeTableViewController *) controller: (NSString *) message;

@end

@interface ScopeTableViewController : UITableViewController {
    NSDictionary *scopesDict;
    NSString *scopeName;
}
@property (nonatomic, retain) NSDictionary *scopesDict;
@property (nonatomic, retain) NSString *scopeName;
@property (nonatomic, weak) id <ScopeViewDelegate> delegate;

- (IBAction)closeButtonTapped:(id)sender;
@end
