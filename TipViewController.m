//
//  TipViewController.m
//  tipcalculator
//
//  Created by Ravi Sathyam on 10/9/14.
//  Copyright (c) 2014 SambarLabs. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentLabel;
- (IBAction)sender:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleDone target:self action: @selector(onSettingsButton)];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultTipValue = [defaults floatForKey:@"defaultTipValue"];
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", defaultTipValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sender:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (void)updateValues {
    float billValue = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmount = billValue * [tipValues[self.tipPercentLabel.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billValue;
   
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount ];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
