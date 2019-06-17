//
//  ViewController.m
//  ObjcTimerProject
//
//  Created by Byunsangjin on 12/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import "ViewController.h"
#import "TimePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)startBtnClick:(id)sender {
    TimePickerViewController *timePickerVC = (TimePickerViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"TimePickerViewController"];
    
    [self addChildViewController: timePickerVC];
    [self.view addSubview: timePickerVC.view];
}

@end
