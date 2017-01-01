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
    _PoohImageView.layer.cornerRadius=15.0f;
    UIImage *img = [UIImage imageNamed:@"download"];
    
    _PoohImageView.image = img;
    self.view.backgroundColor=[UIColor blackColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
