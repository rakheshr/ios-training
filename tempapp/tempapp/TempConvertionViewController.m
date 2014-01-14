//
//  TempConvertionViewController.m
//  tempapp
//
//  Created by Rakhesh on 1/13/14.
//  Copyright (c) 2014 Rakhesh. All rights reserved.
//

#import "TempConvertionViewController.h"

@interface TempConvertionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitText;
@property (weak, nonatomic) IBOutlet UITextField *celsiusText;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
- (IBAction)convertAction:(id)sender;


- (void) converToFahrenheit:(float) celsiusValue;
- (void) convertToCelsius: (float) fahrenValue;

- (IBAction)editFahrenHeitValue:(id)sender;
- (IBAction)editCelsiusValue:(id)sender;

- (IBAction)onTap:(id)sender;

@end

@implementation TempConvertionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calculateTemperature {
    if(nil != self.fahrenheitText.text && ![self.fahrenheitText.text isEqualToString:@"" ])
    {
        float fahren = [self.fahrenheitText.text floatValue];
        [self convertToCelsius:fahren];
    }
    if(nil != self.celsiusText.text && ![self.celsiusText.text isEqualToString:@""]) {
        float celcius = [self.celsiusText.text floatValue];
        [self converToFahrenheit:celcius];
    }
}

- (IBAction)convertAction:(id)sender {
    
    [self calculateTemperature];
    
    
}


- (void) converToFahrenheit:(float) celsiusValue
{
    //c * 9 then / 5 + 32;
    float fahrenHeit = ((celsiusValue * 9 ) /5 ) + 32;
    self.fahrenheitText.text = [NSString stringWithFormat:@"%0.2f",fahrenHeit ];
    
    
}

- (void) convertToCelsius:(float) fahrenValue
{
    // f - 32 * 5 / 9
    
    float celsiusVal = ((fahrenValue -32)* 5)/9;
    self.celsiusText.text = [NSString stringWithFormat:@"%0.2f",celsiusVal ];
    
    
}

- (IBAction)editFahrenHeitValue:(id)sender {
    self.celsiusText.text = @"";
}

- (IBAction)editCelsiusValue:(id)sender {
    self.fahrenheitText.text = @"";
}

- (IBAction)onTap:(id)sender {
   // commenting this to have the caluculation done only when clicking the button. 
    //[self calculateTemperature];
    [self.view endEditing:YES];
}



@end
