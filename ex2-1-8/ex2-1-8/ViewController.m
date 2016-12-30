//
//  ViewController.m
//  ex2-1-8
//
//  Created by ryota on 2016/12/30.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "OverlayView.h"
@interface ViewController ()

@property(nonatomic, strong) UIView *areaView;
@property(nonatomic, strong) UIPickerView *areaPickerView;
@property(nonatomic, strong) OverlayView *overlayView;

@property(nonatomic, strong) NSArray *areaList;
@property(nonatomic, strong) UILabel *areaLabel;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _areaLabel.userInteractionEnabled = YES;
    _areaLabel.tag = 100;
    _areaList = @[
                      @[@"1", @"北海道"],
                      @[@"2", @"東北"],
                      @[@"3", @"関東・信越"],
                      @[@"4", @"東海・北陸・近畿"],
                      @[@"5", @"中国・四国"],
                      @[@"6", @"九州"],
                      @[@"7", @"沖縄"],
                      ];
    
    
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
    _overlayView.backgroundColor = [UIColor blackColor];
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

- (void)hideAreaView{
    [UIView animateWithDuration:.20 animations:^{
        _areaView.transform = CGAffineTransformIdentity;
    }];
    _overlayView.frame = CGRectZero;
}

static const float AREA_PICKER_ACCESSORY_HEIGHT = 44;
static const float AREA_PICKER_HEIGHT = 216;

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
    areaPickerAccessoryView.backgroundColor = [UIColor whiteColor];
    
    // 2-2. 決定ボタン作成
    const float DONE_BUTTON_WEDTH = 80;
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneBtn.frame = CGRectMake(width - DONE_BUTTON_WEDTH,
                               4,
                               DONE_BUTTON_WEDTH,
                               36);
    doneBtn.backgroundColor = [UIColor whiteColor];
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [doneBtn addTarget:self
                action:@selector(performAreaDoneButtonAction)
      forControlEvents:UIControlEventTouchUpInside];
    [areaPickerAccessoryView addSubview:doneBtn];
    [_areaView addSubview:areaPickerAccessoryView];
    
    // 3. ピッカー作成
    _areaPickerView =
    [[UIPickerView alloc] initWithFrame:CGRectMake(0,
                                                   AREA_PICKER_ACCESSORY_HEIGHT,
                                                   width,
                                                   AREA_PICKER_HEIGHT)];
    _areaPickerView.backgroundColor = [UIColor whiteColor];
    _areaPickerView.delegate = self;
    _areaPickerView.dataSource = self;
    [_areaPickerView selectRow:2 inComponent:0 animated:NO]; // 初期値設定
    [_areaView addSubview:_areaPickerView];
}

- (void)performAreaDoneButtonAction{
    NSInteger row = [_areaPickerView selectedRowInComponent:0];
    NSLog(@"areaCode:%@, areaName:%@", _areaList[row][0], _areaList[row][1]);
    _areaLabel.text = _areaList[row][1];
    [self hideAreaView];
}

// UIPickerViewDataSource, UIPickerViewDelegate delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _areaList.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _areaList[row][1];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    if ( touch.view.tag == _areaLabel.tag )
        [self showAreaView:_areaLabel];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _areaLabel.text = _areaList[row][1];
}
@end
