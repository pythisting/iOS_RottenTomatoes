//
//  SettingsViewController.m
//  Rotten Tomatoes
//
//  Created by Pythis Ting on 1/26/15.
//  Copyright (c) 2015 Yahoo!, inc. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *displayModeSwitch;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadUserPrefs {
    // load user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    long displayMode = [defaults integerForKey:@"displayMode"];
    
    
    NSLog(@"display:%ld",displayMode);
    if (displayMode >= 0) {
        self.displayModeSwitch.selectedSegmentIndex = displayMode;
    }
}

- (void) saveUserPrefs {
    // access user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.displayModeSwitch.selectedSegmentIndex >= 0) {
        [defaults setInteger:self.displayModeSwitch.selectedSegmentIndex forKey:@"displayMode"];
    }
    [defaults synchronize];
}

- (void) updateUI {
    [self saveUserPrefs];
    [self loadUserPrefs];
}

@end
