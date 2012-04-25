//
//  SetupViewController.m
//  BF3Tools
//
//  Created by Mathieu Hendey on 12/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController
@synthesize updateButton;
@synthesize platformSegment;
@synthesize gamertagField;
@synthesize platform, gamertag, activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    bool isSetUp =  [defaults boolForKey:@"setup"];
    
    if (isSetUp) {
        NSLog(@"derp");

        updateButton.hidden = NO;
    }
    
    else {
        updateButton.hidden = YES;
    }

    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewDidUnload
{
    [self setPlatformSegment:nil];
    [self setGamertagField:nil];

    [self setUpdateButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)textFieldReturn:(id)sender {
    gamertag = gamertagField.text;
    gamertag = [gamertag stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    switch (self.platformSegment.selectedSegmentIndex) {
        case 0:
            platform = @"pc";
            break;
        case 1:
            platform = @"360";
            break;
        case 2:
            platform = @"ps3";
            break;

        default:
            break;
    }


    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:platform forKey:@"platform"];
    [defaults setObject:gamertag forKey:@"gamertag"];
    [defaults synchronize];
    NSLog(@"Data saved");
    [self beginUpdate];
    [gamertagField resignFirstResponder];
}

- (void) beginUpdate {
    
      

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    

    gamertag = [defaults objectForKey:@"gamertag"];
    platform = [defaults objectForKey:@"platform"];
    NSLog(@"%@", [defaults objectForKey:@"gamertag"]);
    NSString *urlString = [NSString stringWithFormat:@"http://api.bf3stats.com/%@/player/?player=%@", platform, gamertag];
    NSLog(@"%@", urlString);
    

    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:urlString]];
    [self performSelectorOnMainThread:@selector(fetchedData:)
                           withObject:data waitUntilDone:YES];
}

- (IBAction)updateButtonPressed:(id)sender {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    [self beginUpdate];
    

}

- (void) fetchedData:(NSData *)responseData {
    NSLog(@"derp");
    bool isSetUp = NO;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:isSetUp forKey:@"setup"];

        
    NSError *error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSDictionary *stats = [json objectForKey:@"stats"];
    NSDictionary *scores = [stats objectForKey:@"scores"];
    NSDictionary *rank = [stats objectForKey:@"rank"];
    NSDictionary *global = [stats objectForKey:@"global"];
    NSDictionary *currentRank = [stats objectForKey:@"rank"];
    NSArray *nextRanks = [stats objectForKey:@"nextranks"];
    NSDictionary *nextRank = [nextRanks objectAtIndex:0];
    NSDictionary *weapons = [stats objectForKey:@"weapons"];
    NSArray *weaponsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weaponsstats" ofType:@"plist"]];
    NSArray *vehiclesArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vehicleCats" ofType:@"plist"]];
    NSDictionary *vehicles = [stats objectForKey:@"vehcats"];
    
    
    

    if ([[json objectForKey:@"status"] isEqualToString:@"notfound"]) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oh oh!"
                                                          message:@"Couldn't find your player on BF3Stats. Make sure you're connected to the Internet, you've entered your gamertag correctly and you have signed up on BF3Stats."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];

        [message show];
    }

    else {
        
        for (NSUInteger i = 0; i < [vehiclesArray count]; i++) {

            NSDictionary *currentVehicle = [vehicles objectForKey:[vehiclesArray objectAtIndex:i]];
            NSArray *unlocks = [currentVehicle objectForKey:@"unlocks"];
            NSString *vehicleName = [currentVehicle objectForKey:@"name"];

            [defaults setObject:unlocks forKey:[NSString stringWithFormat:@"%@ unlocks", [vehiclesArray objectAtIndex:i]]];
            [defaults setObject:vehicleName forKey:[NSString stringWithFormat:@"%@ name", [vehiclesArray objectAtIndex:i]]];
            [defaults setInteger:[[currentVehicle objectForKey:@"kills"] intValue] forKey:[NSString stringWithFormat:@"%@ kills", [vehiclesArray objectAtIndex:i]]];
            [defaults setInteger:[[currentVehicle objectForKey:@"score"] intValue] forKey:[NSString stringWithFormat:@"%@ score", [vehiclesArray objectAtIndex:i]]];
        }

        for (NSUInteger i =0; i < [weaponsArray count]; i++) {
            NSDictionary *currentWeapon = [weapons objectForKey:[weaponsArray objectAtIndex:i]];
            NSArray *unlocks = [currentWeapon objectForKey:@"unlocks"];
            [defaults setInteger:[unlocks count] forKey:[NSString stringWithFormat:@"%@ numberofunlocks", [weaponsArray objectAtIndex:i]]];
            [defaults setObject:unlocks forKey:[NSString stringWithFormat:@"%@ unlocks", [weaponsArray objectAtIndex:i]]];
            [defaults setInteger:[[currentWeapon objectForKey:@"kills"] intValue] forKey:[NSString stringWithFormat:@"%@ kills", [weaponsArray objectAtIndex:i]]];
            [defaults setInteger:[[currentWeapon objectForKey:@"headshots"] intValue] forKey:[NSString stringWithFormat:@"%@ headshots", [weaponsArray objectAtIndex:i]]];
            [defaults setInteger:[[currentWeapon objectForKey:@"hits"] intValue] forKey:[NSString stringWithFormat:@"%@ hits", [weaponsArray objectAtIndex:i]]];
            [defaults setInteger:[[currentWeapon objectForKey:@"shots"] intValue] forKey:[NSString stringWithFormat:@"%@ shots", [weaponsArray objectAtIndex:i]]];
            
        }
        
        

        float accuracy = ([[global objectForKey:@"hits"] floatValue] / [[global objectForKey:@"shots"] floatValue]) * 100;
        float wlRatio = ([[global objectForKey:@"wins"] floatValue] / [[global objectForKey:@"losses"] floatValue]);
        int remaining = [[nextRank objectForKey:@"left"] intValue];
        float score = [[scores objectForKey:@"score"] floatValue];
        float kills = [[global objectForKey:@"kills"] floatValue];
        float deaths = [[global objectForKey:@"deaths"] floatValue];
        float playTime = [[global objectForKey:@"time"] floatValue];
        playTime = playTime / 60;
        float scorePerMinute = score / playTime;
        float kdr = kills / deaths;
        float headshot = [[global objectForKey:@"longesths"] floatValue];

        NSString *imagePath = [NSString stringWithFormat:@"%@",[rank objectForKey:@"img_large"]];
        imagePath = [imagePath stringByReplacingOccurrencesOfString:@"rankslarge/" withString:@"rank"];

        int differenceBetweenRanks = ([[nextRank objectForKey:@"score"] intValue] - [[currentRank objectForKey:@"score"] intValue]);
        float rankProgress = differenceBetweenRanks - remaining;
        float percentageComplete = (rankProgress / differenceBetweenRanks);
        isSetUp = YES;

        [defaults setObject:[NSString stringWithFormat:@"%@", [json objectForKey:@"name"]] forKey:@"name"];
        [defaults setObject:imagePath forKey:@"imagepath"];
        [defaults setFloat:score forKey:@"score"];
        [defaults setFloat:kills forKey:@"kills"];
        [defaults setFloat:deaths forKey:@"deaths"];
        [defaults setFloat:kdr forKey:@"kdr"];
        [defaults setFloat:percentageComplete forKey:@"percentage"];
        [defaults setFloat:scorePerMinute forKey:@"scoreperminute"];
        [defaults setInteger:remaining forKey:@"remaining"];
        [defaults setInteger:differenceBetweenRanks forKey:@"difference"];
        [defaults setFloat:accuracy forKey:@"accuracy"];
        [defaults setFloat:wlRatio forKey:@"wlratio"];
        [defaults setBool:isSetUp forKey:@"setup"];
        [defaults setFloat:headshot forKey:@"longestheadshot"];
        [defaults synchronize];
        
        [TestFlight passCheckpoint:@"Set up stats"];

    }

  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    
}

@end
