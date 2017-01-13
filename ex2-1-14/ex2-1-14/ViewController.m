//
//  ViewController.m
//  ex2-1-14
//
//  Created by ryota on 2017/01/13.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation ViewController
{
    NSArray *titles;
    NSArray *images;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]    initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:@"Cell"
                             ];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    cell.textLabel.text = titles[indexPath.row];
    return cell;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _table.delegate = self;
    _table.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    titles = [dic objectForKey:@"names"];
    images = [dic objectForKey:@"images"];
    
    _table.estimatedRowHeight = 0;
    _table.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
