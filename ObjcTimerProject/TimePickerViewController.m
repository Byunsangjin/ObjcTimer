//
//  TimePickerViewController.m
//  ObjcTimerProject
//
//  Created by Byunsangjin on 13/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import "TimePickerViewController.h"

@interface TimePickerViewController ()

@end

@implementation TimePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    [self setLabelInPickerView];
    UIColor *color = [[UIColor new] initWithRed: 0 green: 0 blue: 0 alpha: 0.6];
    [self.view setBackgroundColor: color];
}



- (void) setLabelInPickerView {
    double componentWidth = UIScreen.mainScreen.bounds.size.width / [self.timePickerView numberOfComponents];
    double componentCenterHeight = self.timePickerView.bounds.size.height / 2;
    
    UILabel *minLabel = [UILabel new];
    [minLabel setFrame: CGRectMake(componentWidth, componentCenterHeight - 15, componentWidth * 2, 30)];
    [minLabel setTextAlignment: NSTextAlignmentCenter];
    [minLabel setText: @"min"];
    
    UILabel *secLabel = [UILabel new];
    [secLabel setFrame: CGRectMake(componentWidth * 2, componentCenterHeight - 15, componentWidth * 2, 30)];
    [secLabel setTextAlignment: NSTextAlignmentCenter];
    [secLabel setText: @"sec"];
    
    
    [self.timePickerView addSubview: minLabel];
    [self.timePickerView addSubview: secLabel];
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 1 || component == 2) { return 60; }
    else { return 0; }
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat: @"%ld", row];
}

@end
