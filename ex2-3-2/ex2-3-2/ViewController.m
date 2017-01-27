//
//  ViewController.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/17.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property DbConnect *conect ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _conect = [[DbConnect alloc]initWithName:@"test.db"];
    [_conect pathSet];
    [_conect creater];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapSendBtn:(id)sender {
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSecondView"]) {
        SecondViewController *secondViewController = segue.destinationViewController;
        secondViewController.connect = _conect;
    }
}
@end
