//
//  CalculatorViewController.h
//  bulletdropcalculator
//
//  Created by Mathieu Hendey on 03/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalcDetailController.h"
#import "ScopeTableViewController.h"

@interface CalculatorViewController : UIViewController <ModalViewDelegate, ScopeViewDelegate> {
    
    IBOutlet UILabel *adjustmentValue;
    IBOutlet UILabel *rangeValue;
    IBOutlet UILabel *milValue;
    IBOutlet UILabel *targetSizeValue;
    IBOutlet UILabel *gunNameLabel;
    IBOutlet UILabel *scopeNameLabel;
    NSString *scopeName;
    NSString *dictionaryToLoad;
    float gravity;
    float scopeValue;
    float reportedUnits;
    float mils;
    float range;
    float adjustment;
    
}

@property (nonatomic, retain) IBOutlet UILabel *adjustmentValue;
@property (nonatomic, retain) IBOutlet UILabel *rangeValue;
@property (nonatomic, retain) IBOutlet UILabel *milValue;
@property (nonatomic, retain) IBOutlet UILabel *targetSizeValue;
@property (nonatomic, retain) IBOutlet UILabel *scopeNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *gunNameLabel;
@property (nonatomic, retain) NSString *scopeName;
@property (nonatomic, retain) NSString *dictionaryToLoad;
@property (nonatomic) float gravity;
@property (nonatomic) float scopeValue;
@property (nonatomic) float reportedUnits;
@property (nonatomic) float mils;
@property (nonatomic) float range;
@property (nonatomic) float adjustment;

- (IBAction)addOneButtonPressed:(id)sender;
- (IBAction)subOneButtonPressed:(id)sender;
- (IBAction)addPointOneButtonPressed:(id)sender;
- (IBAction)subPointOneButtonPressed:(id)sender;


- (void) updateValues;

@end
