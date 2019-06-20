//
//  TimePickerViewController.m
//  ObjcTimerProject
//
//  Created by Byunsangjin on 13/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import "TimePickerViewController.h"
#import "ViewController.h"

@interface TimePickerViewController ()

@end

@implementation TimePickerViewController

// MARK:- Methods
- (void)viewDidLoad {
    [super viewDidLoad];
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    [self setUI];
}



- (void) setUI {
    [self setLabelInPickerView];
    
    UIColor *color = [[UIColor new] initWithRed: 0 green: 0 blue: 0 alpha: 0.6];
    [self.view setBackgroundColor: color];
    
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    [tap addTarget: self action: @selector(dismissAlert)];
    [self.view addGestureRecognizer: tap];
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



- (void) dismissAlert {
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}



// MARK:- Actions
- (IBAction)okBtnClick:(id)sender {
    ViewController *parentVC = (ViewController *)[self parentViewController];
    [parentVC.timeLabel setText: [NSString stringWithFormat: @"%02ld : %02ld", self.min, self.sec]]; // 라벨에 세팅
    
    // 프로퍼티에 세팅
    parentVC.min = self.min;
    parentVC.sec = self.sec;
    
    [self dismissAlert];
}



- (IBAction)cancelBtnClick:(id)sender {
    [self dismissAlert];
}



// MARK:- UIPickerViewDataSource
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



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 1) {
        self.min = row;
    } else {
        self.sec = row;
    }
}
@end
