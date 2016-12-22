//
//  ViewController.m
//  ex2-1-3
//
//  Created by ryota on 2016/12/23.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *BackGroundImage;

@end

@implementation ViewController

- (IBAction)ChangeBT:(id)sender {
    NSArray<UIImage *> *IMGArrs = @[[UIImage imageNamed:@"pooh_ex_02.jpg"],[UIImage imageNamed:@"0101094006.jpg"],[UIImage imageNamed:@"mig.jpeg"],[UIImage imageNamed:@"download.jpeg"],[UIImage imageNamed:@"55039133.png"]];
    int value =(int)arc4random_uniform((u_int32_t)IMGArrs.count);    _BackGroundImage.contentMode=UIViewContentModeScaleAspectFit;
    _BackGroundImage.image=IMGArrs[value];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
