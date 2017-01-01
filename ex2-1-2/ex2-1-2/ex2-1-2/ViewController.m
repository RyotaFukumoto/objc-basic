//
//  ViewController.m
//  ex2-1-2
//
//  Created by ryota on 2016/12/23.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *PoohImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _PoohImageView.contentMode =  UIViewContentModeScaleAspectFit;
    _PoohImageView.clipsToBounds=YES;
    _PoohImageView.layer.cornerRadius=100;
    UIImage *img = [UIImage imageNamed:@"pooh_ex_02.jpg"];
    _PoohImageView.image = img;
    sel
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
