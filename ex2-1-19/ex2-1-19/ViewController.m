//
//  ViewController.m
//  ex2-1-19
//
//  Created by ryota on 2017/01/14.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *texField;
@property (weak, nonatomic) IBOutlet UIButton *send;
- (IBAction)tapSendBtn:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapSendBtn:(id)sender {
    _arguments = _texField.text;
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSecondView"]) {
        SecondViewController *secondViewController = segue.destinationViewController;
        secondViewController.arguments = _arguments;
    }
}
@end
