//
//  ViewController.m
//  ex2-4-1
//
//  Created by ryota on 2017/01/31.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "ApiConnect.h"
@interface ViewController ()
@property ApiConnect *apiCon;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _apiCon = [[ApiConnect alloc]
               initWithPath:@"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)weatherBtn:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"東京の天気"
                                          message:@"取得したい日を選んでください"
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"今日"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction *action) {
                                    [_apiCon getJson:0];
    }]];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"明日"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction *action) {
                                    [_apiCon getJson:1];
    }]];
    [alertController addAction:[UIAlertAction
                               actionWithTitle:@"明後日"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action) {
                                   [_apiCon getJson:2];
                               }]];
    // 画面に表示します
    [self presentViewController:alertController animated:YES completion:nil];

}


@end
