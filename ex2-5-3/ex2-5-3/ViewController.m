//
//  ViewController.m
//  ex2-5-3
//
//  Created by ryota on 2017/07/24.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

//UI
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
- (IBAction)takePhoto:(id)sender;
//AV Foundation
@property (nonatomic) AVCaptureSession  *captS;
@property AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) AVCapturePhotoOutput *imgOut;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.captS = [[AVCaptureSession alloc] init];
    self.captS.sessionPreset = AVCaptureSessionPreset1920x1080;
    self.imgOut = [[AVCapturePhotoOutput alloc] init];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = [[NSError alloc] init];
    
    @try{
        AVCaptureDeviceInput* input = [[AVCaptureDeviceInput alloc] initWithDevice:device
                                                                             error:&error];
        if ([self.captS canAddInput:input]) {
            [self.captS addInput:input];
            if ([self.captS canAddOutput:self.imgOut]) {
                [self.captS addOutput:self.imgOut];
                [self.captS startRunning];
                AVCaptureVideoPreviewLayer* captureVideoLayer =
                [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.captS];
                
                captureVideoLayer.frame = self.imgV.bounds;
                captureVideoLayer.videoGravity = AVLayerVideoGravityResizeAspect;
                [self.imgV.layer addSublayer:captureVideoLayer];
            }
        }
    }
    @catch (NSException *ex){
        NSLog(@"%@",error);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(UIButton *)sender {
    AVCapturePhotoSettings* settings = [[AVCapturePhotoSettings alloc] init];
    settings.flashMode = AVCaptureFlashModeAuto;
    
    
    [self.imgOut capturePhotoWithSettings:settings
                                           delegate:self];
}

-(void)captureOutput:(AVCapturePhotoOutput *)captureOutput
didFinishProcessingPhotoSampleBuffer:(nullable CMSampleBufferRef)photoSampleBuffer
previewPhotoSampleBuffer:(nullable CMSampleBufferRef)previewPhotoSampleBuffer
    resolvedSettings:(nonnull AVCaptureResolvedPhotoSettings *)resolvedSettings
     bracketSettings:(nullable AVCaptureBracketedStillImageSettings *)bracketSettings
               error:(nullable NSError *)error
{
    
    
    NSData* photoData = [AVCapturePhotoOutput
                         JPEGPhotoDataRepresentationForJPEGSampleBuffer:photoSampleBuffer
                         previewPhotoSampleBuffer:previewPhotoSampleBuffer];
    
    UIImage* resutImage = [[UIImage alloc] initWithData:photoData];
    
    // UIImageをCIImageに変換
    CIImage *filteredImage = [[CIImage alloc] initWithCGImage:resutImage.CGImage];
    
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
    UIImageWriteToSavedPhotosAlbum(outputImage, nil, nil, nil);
}
@end
