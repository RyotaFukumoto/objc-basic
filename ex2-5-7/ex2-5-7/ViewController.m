//
//  ViewController.m
//  ex2-5-7
//
//  Created by ryota on 2017/07/28.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()<MKMapViewDelegate>

@property (nonatomic)MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    double latitude = 35.56455;
    double longitude = 139.715544;
    //Mapの表示を指定
    MKCoordinateRegion region = self.mapView.region;
    region.span.latitudeDelta = 0.008;
    region.span.longitudeDelta = 0.008;
    
    region.center = CLLocationCoordinate2DMake(latitude, longitude);
    [self.mapView setRegion:region animated:YES];
    
    //Pin表示
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude); //ピンをたてる位置を指定
    [self.mapView addAnnotation:annotation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
