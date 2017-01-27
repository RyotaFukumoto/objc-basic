//
//  ViewController.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/17.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "DbConnect.h"
@interface ViewController ()
@property DbConnect *conect ;
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _conect = [[DbConnect alloc]initWithName:@"test.db"];
    [_conect pathSet];
    [_conect creater];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [_conect selector];
        [_tableV reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _conect.todoList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr
    =[formatter stringFromDate:_conect.todoList[indexPath.row].limit_date];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"myCell"];
    }
    
    if(dateStr== NULL){
        dateStr = @"";
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",
                           dateStr,
                           _conect.todoList[indexPath.row].todo_title];
    
    return cell;
}
-(void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [_conect deleter:_conect.todoList[indexPath.row].todo_id];
        [_conect selector];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        [tableView performSelector:@selector(reloadData)
                        withObject:nil afterDelay:0.5];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapSendBtn:(id)sender {
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSecondView"]) {
        SecondViewController *secondViewController
        = segue.destinationViewController;
        secondViewController.connect = _conect;
    }
}
@end
