//
//  ViewController.m
//  ex2-4-3
//
//  Created by ryota on 2017/02/03.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "DbConnector.h"
#import "Weather.h"
typedef NS_ENUM(NSInteger,dataType) {
    image = 0,
    date = 1,
    telop = 2
};
@interface ViewController ()

@property ApiConnect *apiCon;
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property NSArray *forecast;
@property NSDictionary *data;
@property DbConnector* connect;
@property Weather* weather;
@property NSString* str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _apiCon = [[ApiConnect alloc]
               initWithPath:@"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"];
    _apiCon.delegate= self;
    [_apiCon forecast];
    _connect  = [[DbConnector alloc]initWithName:@"weather.db"];
    [_connect pathSet];
    [_connect creater];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return _connect.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        WTableViewCell *wcell = [tableView dequeueReusableCellWithIdentifier:@"WCell"];
        Weather *weather = _connect.list[indexPath.row];
        
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: weather.icon]]];
        wcell.wImageV.image = img;
    NSLog(@"%@",weather.date);
        NSString *tex=[NSString stringWithFormat:@"%@ %@",weather.date,weather.forecast];
        
        wcell.wLabel.text = tex;
        //        tableView.rowHeight = 50;
           NSLog(@"%@",wcell.wLabel.text);
        return wcell;
     
 
}

-(void)finish:(NSArray*)forecasts{
    for (NSDictionary *data in forecasts) {
        NSDictionary *image = data[@"image"];
        Weather *weather = [[Weather alloc]initWithWeather:data[@"date"] forcast:data[@"telop"] icon:image[@"url"]];
        [_connect insertor: weather];
    }
    [_connect selector];
    [_tableV reloadData];
}

                      
@end
