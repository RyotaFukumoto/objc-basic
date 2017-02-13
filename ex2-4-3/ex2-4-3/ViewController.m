//
//  ViewController.m
//  ex2-4-3
//
//  Created by ryota on 2017/02/03.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _apiCon = [[ApiConnect alloc]
               initWithPath:@"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"];
    _apiCon.delegate= self;
    [_apiCon forecast];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [_apiCon contentCcount]+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([_apiCon contentCcount]>indexPath.row){
        WTableViewCell *wcell = [tableView dequeueReusableCellWithIdentifier:@"WCell"];

        _data= _forecast[indexPath.row];
        NSDictionary *image = _data[@"image"];
        
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: image[@"url"]]]];
        wcell.wImageV.image = img;
        NSString *tex=[NSString stringWithFormat:@"%@ %@",_data[@"date"],_data[@"telop"]];

        wcell.wLabel.text = tex;
        //        tableView.rowHeight = 50;
           NSLog(@"%@",wcell.wLabel.text);
        return wcell;
     
    }else{
        TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TCell"];
        cell.texL.text = [NSString stringWithFormat:@"%@", [_apiCon getText]];
        
        NSLog(@"%@",[_apiCon getText]);
        tableView.estimatedRowHeight = 90;
        tableView.rowHeight = UITableViewAutomaticDimension;
         return cell;
        }

}


-(void)finish:(NSArray*)forecasts{
    _forecast = forecasts;

    [_tableV reloadData];
}

                      
@end
