//
//  ViewController.m
//  ex2-1-6
//
//  Created by ryota on 2016/12/23.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *WebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *webPage = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:webPage];
    NSURLRequest* request =[NSURLRequest requestWithURL:url];
    [_WebView loadRequest:request];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reload:(id)sender {
    [_WebView reload];
}
- (IBAction)Back:(id)sender {
    if( _WebView.canGoBack ){
        [_WebView goBack];
    }
    
}
- (IBAction)forward:(id)sender {
    if(_WebView.canGoForward){
        [_WebView goForward];
    }
}
-(void)webView:(UIWebView *)WebView didFailLoadWithError:(NSError *)error{
    if([error code] != NSURLErrorCancelled) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ロードエラー"
                                                                                 message:@"通信状況を確認しリロードしてください"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
        [alertController addAction:[UIAlertAction actionWithTitle:@"リロード"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              [_WebView reload];
                                                          }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
