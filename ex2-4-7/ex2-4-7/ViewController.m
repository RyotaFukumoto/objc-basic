//
//  ViewController.m
//  ex2-4-7
//
//  Created by ryota on 2017/07/16.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIImage *img;
- (IBAction)imgSelectBtn:(id)sender;
- (IBAction)imgTransmissionBtn:(id)sender;

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


-(void)imagePickerController:(UIImagePickerController*)picker
       didFinishPickingImage:(UIImage*)image editingInfo:(NSDictionary*)editingInfo{
    
    _img = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)imgSelectBtn:(id)sender {
    
    if([UIImagePickerController
        isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        imgPicker
        .delegate = self;
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
    
    
}

- (IBAction)imgTransmissionBtn:(id)sender {
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"Twitter is not Available");
        return;
    }
    SLComposeViewController *composeViewController =
    [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    composeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Done");
        }
    };
    [composeViewController addImage:_img];
    
    [self presentViewController:composeViewController animated:YES completion:nil];
    
}
@end
