//
//  ViewController.m
//  ex2-5-2
//
//  Created by ryota on 2017/07/24.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

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

- (IBAction)pushedCameraButton:(id)sender
{
    // カメラついてるかチェック
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Non camera...");
        return;
    }
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context
{
    if (error) {
        // mistake
    } else {
        // success
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    // カメラロールに画像を保存する
    

    
    // UIImageをCIImageに変換
    CIImage *filteredImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    
    // CIFilterを作成（今回はモノクロ風フィルタをかけます）
    CIFilter *filter = [CIFilter filterWithName:@"CIMinimumComponent"];
    [filter setValue:filteredImage forKey:@"inputImage"];
    
    // フィルタ後の画像を取得
    filteredImage = filter.outputImage;
    
    // CIImageをUIImageに変換する
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [ciContext createCGImage:filteredImage
                                          fromRect:[filteredImage extent]];
    UIImage *outputImage  = [UIImage imageWithCGImage:imageRef
                                                scale:1.0f
                                          orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    
    
    UIImageWriteToSavedPhotosAlbum(outputImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    [self dismissViewControllerAnimated:YES completion:nil];
    _imgV.image = outputImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
