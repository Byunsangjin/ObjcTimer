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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



-(void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.timeLabel setText: [self timeSubOne: self.timeLabel.text]];
    }];
    
    
}



-(NSString *)timeSubOne: (NSString *)time {
    NSArray *timeArray = [time componentsSeparatedByString: @" : "];
    NSInteger minute = [timeArray[0] integerValue];
    NSInteger sec = [timeArray[1] integerValue];
    
    if (minute == sec && minute == 0) {
        NSLog(@"끝!!!!");
    } else if (sec == 0) {
        minute -= 1;
        sec = 59;
    } else {
        sec -= 1;
    }
    
    return [NSString stringWithFormat:@"%02ld : %02ld", minute, sec];
}



// MARK:- Actions
- (IBAction)timeSetBtnClick:(id)sender {
    TimePickerViewController *timePickerVC = (TimePickerViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"TimePickerViewController"];
    
    [self addChildViewController: timePickerVC];
    [self.view addSubview: timePickerVC.view];
}



- (IBAction)startBtnClick:(id)sender {
    if ([self.timeLabel.text isEqualToString: @"00 : 00"]) {
        return;
    }
    
    if ([self.startButton tag] == 0) { // start 일때
        [self startTimer];
        [self.startButton setTitle:@"record" forState:UIControlStateNormal];
        [self.timeSetButton setEnabled:NO];
        
        self.startButton.tag = 1;
    } else { // record 일때
        self.startButton.tag = 0;
    }
}



- (IBAction)stopBtnClick:(id)sender {
    [self.timer invalidate];
    [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    [self.timeSetButton setEnabled:YES];
    
//    self.startButton.tag = 0;
}




@end
