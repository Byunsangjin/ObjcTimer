//
//  ViewController.h
//  ObjcTimerProject
//
//  Created by Byunsangjin on 12/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *timeSetButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property NSTimer *timer;
@property NSInteger min;
@property NSInteger sec;

@end

