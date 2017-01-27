//
//  SecondViewController.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/18.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "SecondViewController.h"
#import "DbConnect.h"
@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dateTexF;
@property (weak, nonatomic) IBOutlet UITextView *detailTexV;
@property (weak, nonatomic) IBOutlet UITextField *titleTexF;
@property NSDateFormatter *dateFormat;
@property NSDate *date;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dateFormat = [[NSDateFormatter alloc] init];
    [_dateFormat setDateFormat:@"yyyy/MM/dd"];
    // Do any additional setup after loading the view.
    UIDatePicker* datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];

    [datePicker addTarget:self
                   action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
    
    _dateTexF.inputView = datePicker;
    _dateTexF.delegate = self;
    
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle  = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    // 完了ボタンとSpacerの配置
    UIBarButtonItem* doneButton
    = [[UIBarButtonItem alloc] initWithTitle:@"完了"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector (pickerDoneClicked)];
    
    UIBarButtonItem *spacer
    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                    target:nil
                                                    action:nil];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    
    // Viewの配置
    _dateTexF.inputAccessoryView = keyboardDoneButtonView;
}
- (IBAction)viewTap:(id)sender {
    [_dateTexF resignFirstResponder];
    [_titleTexF resignFirstResponder];
    [_detailTexV resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)send:(id)sender {
    if([_titleTexF.text  isEqual: @""]){
        
    }else{
        [_connect insertor:_titleTexF.text contents:_detailTexV.text limit:_date];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker *)sender;
    _date = picker.date;
    _dateTexF.text = [_dateFormat stringFromDate:_date];
}

-(void)pickerDoneClicked {
    [_dateTexF resignFirstResponder];

}

@end
