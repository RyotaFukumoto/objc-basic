//
//  ViewController.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/17.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir  = [paths objectAtIndex:0];
    databasePath   = [dir stringByAppendingPathComponent:@"test.db"];
    [self etcProcedure];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)etcProcedure{
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    NSString *sql = @"CREATE TABLE IF NOT EXISTS SAMPLE_TABLE (todo_id INTEGER NOT NULL PRIMARY KEY,todo_title varchar NOT NULL, todo_conyrnts TEXT,created datetime,modified datetime,limit_date datetime,delete_flag bool);";
    [db open];
    [db executeUpdate:sql];
    [db close];
}


@end
