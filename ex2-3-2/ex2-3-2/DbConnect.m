//
//  dbConnect.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "DbConnect.h"
#import "FMDatabase.h"
@interface DbConnect()
@property FMDatabase *db;
@property NSString *sql;
@property NSString *dbName;
@end
@implementation DbConnect
-(id)initWithName:(NSString*) dbName {
    if(self = [super init]){
    _dbName = dbName;
    }
    return self;
}
-(void)pathSet{
    NSArray *paths
    = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,
                                          NSUserDomainMask, YES );
    NSString *dir  = [paths objectAtIndex:0];
    _databasePath   = [dir stringByAppendingPathComponent:_dbName];
    _db = [FMDatabase databaseWithPath:_databasePath];
    NSLog(@"%@",_databasePath);

}

-(void)creater{
        _sql = @"CREATE TABLE IF NOT EXISTS SAMPLE_TABLE(todo_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,todo_title varchar NOT NULL, todo_contents TEXT,created datetime,modified datetime,limit_date datetime,delete_flag bool);";
    [_db open];
    [_db executeUpdate:_sql];
    [_db close];
}

-(void)selector{
    _todoList = [[NSMutableArray alloc]init];
    _sql = @"SELECT todo_id,todo_title,todo_contents,limit_date FROM SAMPLE_TABLE WHERE delete_flag = ? ORDER BY limit_date;";
    [_db open];
    FMResultSet *results = [_db executeQuery:_sql,[NSNumber numberWithBool:NO]];
    while( [results next] ) {
        int todo_id = [results intForColumn:@"todo_id"];
        NSString *todo_title = [results stringForColumn:@"todo_title"];
        NSString *todo_contents = [results stringForColumn:@"todo_contents"];
        NSDate *limit_date = [results dateForColumn:@"limit_date"];
        [_todoList addObject:[[ListSeter alloc] initWithData:todo_id
                                                       title:todo_title
                                                    contents:todo_contents
                                                       limit:limit_date]];
    }
    [_db close];
}
-(void)insertor:(NSString*)todo_title
       contents:(NSString *)todo_contents
          limit:(NSDate *)limit_date{
    _sql = @"INSERT INTO SAMPLE_TABLE (todo_title,todo_contents,created,modified,limit_date,delete_flag)VALUES(?,?,?,?,?,?)";
    [_db open];
    [_db executeUpdate:_sql,
     todo_title,
     todo_contents,[NSDate date],[NSDate date],
     limit_date,[NSNumber numberWithBool:NO]];
    [_db close];
    
}
    

-(void)deleter:(NSInteger)todo_id{
    NSString *sql =  @"UPDATE SAMPLE_TABLE SET delete_flag = ? WHERE todo_id = ?;";
    [_db open];
    [_db executeUpdate:sql, [NSNumber numberWithBool:YES],
     [NSNumber numberWithInt:(int)todo_id]];
    [_db close];
    
}



@end
