//
//  ThirdViewController.m
//  Wireframe
//
//  Created by leeloo on 03/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    [super viewDidLoad];
    
    arrayTurbines = [[NSMutableArray alloc] init];
    [arrayTurbines addObject:@"Turbine 1"];
    [arrayTurbines addObject:@"Turbine 2"];
    [arrayTurbines addObject:@"Turbine 3"];
    [arrayTurbines addObject:@"Turbine 4"];
    [arrayTurbines addObject:@"Turbine 5"];
    [arrayTurbines addObject:@"Turbine 6"];
    [arrayTurbines addObject:@"Turbine 7"];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [arrayTurbines count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arrayTurbines objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Selected Turbine: %@. Index of selected color: %i", [arrayTurbines objectAtIndex:row], row);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
