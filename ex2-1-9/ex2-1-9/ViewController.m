//
//  ViewController.m
//  ex2-1-9
//
//  Created by ryota on 2016/12/30.
//  Copyright © 2016年 ryota. All rights reserved.
//
#import "ViewController.h"
#import "OverlayView.h"

@interface ViewController ()
@property(nonatomic, strong) UIView *areaView;
@property(nonatomic, strong) UIDatePicker *datePicker;
@property(nonatomic, strong) OverlayView *overlayView;

@property(nonatomic, strong) UILabel *areaLabel;
@end

@implementation ViewController

static const float AREA_PICKER_ACCESSORY_HEIGHT = 44;
static const float AREA_PICKER_HEIGHT = 214;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _areaLabel.userInteractionEnabled = YES;
    _areaLabel.tag = 100;
    
    // エリア表示用ラベルの作成
    _areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    _areaLabel.backgroundColor = [UIColor lightGrayColor];
    _areaLabel.center = CGPointMake(self.view.bounds.size.width / 2, 150);
    _areaLabel.textAlignment = NSTextAlignmentCenter;
    _areaLabel.text=@"タップ";
    [self.view addSubview:_areaLabel];
    
    // キャンセル用ビューの作成
    _overlayView = [[OverlayView alloc] initWithFrame:CGRectZero];
    _overlayView.target = self;
    _overlayView.action = @selector(hideAreaView);
    _overlayView.alpha = 0.4;
    [self.view addSubview:_overlayView];
    
    // エリア選択ピッカーの作成
    [self buildAreaPickerView];
}
- (void)showAreaView:(UILabel*)label{
    [self.view bringSubviewToFront:_overlayView]; // 最前面に移動
    [self.view bringSubviewToFront:_areaView]; // 最前面に移動
    _overlayView.frame = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:.20 animations:^{
        _areaView.transform = CGAffineTransformMakeTranslation(0, -(AREA_PICKER_ACCESSORY_HEIGHT + AREA_PICKER_HEIGHT));
    }];
}
- (void)buildAreaPickerView{
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    
    // 1. アクセサリビューとピッカービューを乗せるビューの作成
    float areaViewHeight = AREA_PICKER_ACCESSORY_HEIGHT + AREA_PICKER_HEIGHT;
    _areaView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                             height,
                                                             width,
                                                             areaViewHeight)];
    [self.view addSubview:_areaView];
    
    // 2-1. アクセサリビュー作成
    UIView *areaPickerAccessoryView =
    [[UIView alloc] initWithFrame:CGRectMake(0,
                                             0,
                                             width,
                                             AREA_PICKER_ACCESSORY_HEIGHT)];
    // 2-2. 決定ボタン作成
    const float DONE_BUTTON_WEDTH = 80;
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneBtn.frame = CGRectMake(width - DONE_BUTTON_WEDTH,
                               4,
                               DONE_BUTTON_WEDTH,
                               36);
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [doneBtn addTarget:self
                action:@selector(performAreaDoneButtonAction)
      forControlEvents:UIControlEventTouchUpInside];
    [areaPickerAccessoryView addSubview:doneBtn];
    [_areaView addSubview:areaPickerAccessoryView];
    
    // 3. ピッカー作成
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,
                                                                    AREA_PICKER_ACCESSORY_HEIGHT,
                                                                    width,
                                                                    AREA_PICKER_HEIGHT)];
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    [_datePicker addTarget:self action:@selector(vChanged:) forControlEvents:UIControlEventValueChanged];
    [_areaView addSubview:_datePicker];
}
- (void)performAreaDoneButtonAction{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    _areaLabel.text = [formatter stringFromDate:_datePicker.date];
    [self hideAreaView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    if ( touch.view.tag == _areaLabel.tag )
        [self showAreaView:_areaLabel];
}


- (void)hideAreaView{
    [UIView animateWithDuration:.20 animations:^{
        _areaView.transform = CGAffineTransformIdentity;
    }];
    _overlayView.frame = CGRectZero;
}
-(void)vChanged:(UIDatePicker*)datePicker{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    _areaLabel.text = [formatter stringFromDate:datePicker.date];
}
@end
