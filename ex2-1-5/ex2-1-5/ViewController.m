//
//  ViewController.m
//  ex2-1-5
//
//  Created by ryota on 2016/12/23.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)ActionSheetBTN:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"シェア"
                                                                             message:@""
            preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Facebook"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self Facebook];
                                                      }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Twitter"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          
                                                          [self Twitter];
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Line"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          
                                                          [self Line];
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Facebook{
    NSLog(@"Facebook");
}
-(void)Twitter{
    NSLog(@"Twitter");
}
-(void)Line{
    NSLog(@"Line");
}

@end
