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

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *timeTopConstraint;

@property NSArray *timeArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTimeProperty];
}



-(void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self secMinusOne];
        
        NSString *curTime = [NSString stringWithFormat:@"%02ld : %02ld", self.min, self.sec];
        [self.timeLabel setText: curTime];
    }];
}



-(void)secMinusOne {
    [self setTimeProperty];
    
    if (self.min == self.sec && self.min == 0) {
        NSLog(@"끝!!!!");
    } else if (self.sec == 0) {
        self.min -= 1;
        self.sec = 59;
    } else {
        self.sec -= 1;
    }
    
//    return [NSString stringWithFormat:@"%02ld : %02ld", self.min, self.sec];
}



-(void)setTimeProperty {
    self.timeArray = [self.timeLabel.text componentsSeparatedByString: @" : "];
    self.min = [self.timeArray[0] integerValue];
    self.sec = [self.timeArray[1] integerValue];
}



// MARK:- Actions
- (IBAction)setTimeClick:(id)sender {
    TimePickerViewController *timePickerVC = (TimePickerViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"TimePickerViewController"];
    
    [self addChildViewController: timePickerVC];
    [self.view addSubview: timePickerVC.view];
    
    [timePickerVC.timePickerView selectRow:self.min inComponent:1 animated:true]; // 분
    [timePickerVC.timePickerView selectRow:self.sec inComponent:2 animated:true]; // 초
    
    timePickerVC.min = self.min;
    timePickerVC.sec = self.sec;
}



- (IBAction)startBtnClick:(id)sender {
    if ([self.timeLabel.text isEqualToString:@"00 : 00"]) {
        return;
    }
    
    if ([self.startButton.titleLabel.text isEqualToString: @"start"]) { // start 일때
        [self startTimer];
        [self.startButton setTitle:@"record" forState:UIControlStateNormal];
        [self.timeSetButton setEnabled:NO];
    } else { // record 일때
        
    }
}



- (IBAction)stopBtnClick:(id)sender {
    if ([self.timer isValid]) { // 타이머가 작동중이면
        [self.timer invalidate];
        [self.startButton setTitle:@"start" forState:UIControlStateNormal];
        [self.stopButton setTitle:@"reset" forState:UIControlStateNormal];
        [self.timeSetButton setEnabled:YES];
    }
    
    if ([self.stopButton.titleLabel.text isEqualToString:@"reset"]) {
        // 클릭 했을 때 전부 초기화        
        [self.stopButton setTitle:@"stop" forState:UIControlStateNormal];
    }
}




@end
