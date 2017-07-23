//
//  ViewController.m
//  ex2-4-8
//
//  Created by ryota on 2017/07/18.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIImage *img;
@property(nonatomic,retain)UIDocumentInteractionController *interactionController;
@property NSURL *instaguramURL;
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
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo{
    _img = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imgSender{
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://camera"];
    
    if([[UIApplication sharedApplication] canOpenURL:instagramURL])     {
        UIImage *imageToUse = _img;
        NSString *documentDirectory=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *saveImagePath=[documentDirectory stringByAppendingPathComponent:@"Image.igo"];
        NSData *imageData=UIImagePNGRepresentation(imageToUse);
        [imageData writeToFile:saveImagePath atomically:YES];
        NSURL *imageURL=[NSURL fileURLWithPath:saveImagePath];
        self.interactionController=[[UIDocumentInteractionController alloc]init];
        self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:imageURL];
        self.interactionController.delegate = self;
        
        NSString* captionString = [NSString  stringWithFormat:@"test"];
        
        self.interactionController.annotation = [NSDictionary dictionaryWithObject: captionString
                                                                            forKey:@"InstagramCaption"];
        self.interactionController.UTI = @"com.instagram.exclusivegram";
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        [self.interactionController presentOpenInMenuFromRect:CGRectMake(1, 1, 1, 1) inView:vc.view animated:YES];
    }
    else {
        NSLog(@"Instagram not found");
    }
    

}

- (IBAction)imgSelectBtn:(id)sender {
    if([UIImagePickerController
        isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc]init];
        imgPicker.delegate = self;
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
}

- (IBAction)imgTransmissionBtn:(id)sender {
    [self imgSender];
}
@end
