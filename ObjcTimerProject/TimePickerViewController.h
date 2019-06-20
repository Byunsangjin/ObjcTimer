//
//  TimePickerViewController.h
//  ObjcTimerProject
//
//  Created by Byunsangjin on 13/06/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimePickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *timePickerView;

@property NSInteger sec;
@property NSInteger min;

- (void) setLabelInPickerView;

@end

NS_ASSUME_NONNULL_END
