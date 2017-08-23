//
//  ViewController.m
//  MyCalender
//
//  Created by ryota on 2017/08/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet FKNCalenderView *FKNCalenderV;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *lastMonthBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextMonthBtn;

@end

@implementation ViewController
- (IBAction)lastMonthBtn:(id)sender {
    [_FKNCalenderV lastMonthSwitch];
}

- (IBAction)nextMonthBtn:(id)sender {
    [_FKNCalenderV nextMonthSwitch];
}

- (void)viewDidLoad {
   
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _FKNCalenderV.delegate = _FKNCalenderV;
    _FKNCalenderV.dataSource = _FKNCalenderV;
    _FKNCalenderV.delegate2 = self;
    
    _FKNCalenderV.selectedDate = [NSDate date];
    [self setSelectedDate:_FKNCalenderV.selectedDate];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setSelectedDate:(NSDate *)selectedDate{
    _FKNCalenderV.selectedDate = selectedDate;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy年M月";
    self.title = [formatter stringFromDate:_FKNCalenderV.selectedDate];
    formatter.dateFormat = @"M";
    
    _lastMonthBtn.enabled = YES;
    _nextMonthBtn.enabled = YES;
    
    if([[formatter stringFromDate:_FKNCalenderV.selectedDate]  isEqual: @"1"]){
        _lastMonthBtn.enabled = NO;
    }else if ([[formatter stringFromDate:_FKNCalenderV.selectedDate]  isEqual: @"12"]){
        _nextMonthBtn.enabled = NO;
    }
}

@end
