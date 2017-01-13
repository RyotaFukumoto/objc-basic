//
//  ViewController.m
//  exd2-1-11
//
//  Created by ryota on 2017/01/01.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation ViewController
{
    NSDictionary *disney;
    NSDictionary *sanrio;
    NSDictionary *character;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [character count];
}
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return character.allKeys[section];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [disney[@"names"]count];
            break;
        case 1:
            return [sanrio[@"names"]count];
            break;

            
        default:
            return 0;
            break;
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]    initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:@"Cell"
                             ];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSString *name;
    UIImage *image;
    
    switch (indexPath.section) {
        case 0:
            name = disney[@"names"][indexPath.row];
            image = [UIImage imageNamed: disney[@"images"][indexPath.row]];
            break;
        case 1:
            name = sanrio[@"names"][indexPath.row];
            image = [UIImage imageNamed: sanrio[@"images"][indexPath.row]];
            break;
            
        default:
            break;
    }
    
    
    
    cell.imageView.image = image;
    cell.textLabel.text =name;
    return cell;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _table.delegate = self;
    _table.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    character = [NSDictionary dictionaryWithContentsOfFile:path];
    disney = [character objectForKey:@"ディズニー"];
    sanrio = [character objectForKey:@"サンリオ"];
    
    _table.estimatedRowHeight = 0;
    _table.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
