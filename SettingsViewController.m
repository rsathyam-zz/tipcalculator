//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Ravi Sathyam on 10/10/14.
//  Copyright (c) 2014 SambarLabs. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTipField;
- (IBAction)sender:(id)sender;
- (void)updateValues;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self updateValues];
}

- (IBAction)sender:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues
{
    float defaultTipValue = [self.defaultTipField.text floatValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:defaultTipValue forKey:@"defaultTipValue"];
    [defaults synchronize];
}

@end
