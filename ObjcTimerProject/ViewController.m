//
//  ViewController.m
//  ObjcTimerProject
//
//  Created by Byunsangjin on 12/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import "ViewController.h"
#import "TimePickerViewController.h"
#import "TimeTableViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *timeTopConstraint;
@property (strong, nonatomic) IBOutlet UITableView *timeTableView;

@property NSArray *timeArray;
@property NSMutableArray *recordArray;
@property BOOL isValid;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setTimeProperty];
    self.recordArray = [NSMutableArray new];
}



- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self secMinusOne];
        [self setTimerLabel];
    }];
}



- (void)secMinusOne {
    [self setTimeProperty];
    
    if (self.min == self.sec && self.min == 0) {
        return;
    } else if (self.sec == 0) {
        self.min -= 1;
        self.sec = 59;
    } else {
        self.sec -= 1;
    }
}



- (void)setTimeProperty {
    self.timeArray = [self.timeLabel.text componentsSeparatedByString: @" : "];
    self.min = [self.timeArray[0] integerValue];
    self.sec = [self.timeArray[1] integerValue];
}



- (void)setTimerLabel {
    NSString *curTime = [NSString stringWithFormat:@"%02ld : %02ld", self.min, self.sec];
    [self.timeLabel setText: curTime];
}



- (void)resetTableView {
    [self.recordArray removeAllObjects];
    [self.timeTableView reloadData];
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
    
    if (self.isValid == NO) { // 타이머가 동작하지 않을때
        [self startTimer];
        [self.startButton setTitle:@"record" forState:UIControlStateNormal];
        [self.stopButton setTitle:@"stop" forState:UIControlStateNormal];
        
        [self.clearButton setHidden:NO];
        [self.timeSetButton setEnabled:NO];
        
        self.isValid = YES;
    } else {
        [self.recordArray addObject:self.timeLabel.text];
        [self.timeTableView reloadData];
    }
}



- (IBAction)stopBtnClick:(id)sender {
    if (self.isValid == YES) { // 타이머가 작동중이면
        [self.startButton setTitle:@"start" forState:UIControlStateNormal];
        [self.stopButton setTitle:@"restart" forState:UIControlStateNormal];
        
        [self.timer invalidate];
        self.isValid = NO;
        
        [self.timeSetButton setEnabled:YES];
        [self.clearButton setHidden:YES];
    } else { // restart
        self.min = 0;
        self.sec = 0;
        
        [self setTimerLabel];
        [self resetTableView];
        
        [self.stopButton setTitle:@"stop" forState:UIControlStateNormal];
    }
}



- (IBAction)clearBtnClick:(id)sender {
    [self resetTableView];
}



// MARK:- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimeTableViewCell *cell = (TimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
    cell.timeRecordLabel.text = self.recordArray[indexPath.row];
    
    return cell;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recordArray.count;
}



@end
