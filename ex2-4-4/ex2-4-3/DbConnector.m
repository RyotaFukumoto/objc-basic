//
//  DbConnector.m
//  ex2-4-3
//
//  Created by ryota on 2017/04/19.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "DbConnector.h"
#import "FMDatabase.h"
#import "Weather.h"
@interface DbConnector()
@property FMDatabase *db;
@property NSString *sql;
@property NSString* dbName;
@end
@implementation DbConnector
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
    _databasePath  = [dir stringByAppendingPathComponent:_dbName];
    _db = [FMDatabase databaseWithPath:_databasePath];
    NSLog(@"%@",_databasePath);
    
}
-(void)creater{
    _sql = @"CREATE TABLE IF NOT EXISTS Weather_Table(date DATETIME PRIMARY KEY, weather TEXT,icon TEXT);";
    [_db open];
    [_db executeUpdate:_sql];
    [_db close];
}
-(void)insertor:(Weather*)weather{
    _sql = @"INSERT OR REPLACE INTO Weather_Table(date,weather,icon)VALUES(?,?,?)";
    [_db open];
    [_db executeUpdate:_sql,
     weather.date,
     weather.forecast,
     weather.icon];
    NSLog(@"%@",weather.date);
    [_db close];
}
-(void)selector{
    _list = [[NSMutableArray alloc]init];
    _sql = @"SELECT * FROM Weather_Table;";
    [_db open];
    FMResultSet *results = [_db executeQuery:_sql,[NSNumber numberWithBool:NO]];
    while( [results next] ) {
        NSString *date = [results stringForColumn:@"date"];
        NSString *weather = [results stringForColumn:@"weather"];
        NSString *icon = [results stringForColumn:@"icon"];
        [_list addObject:[[Weather alloc] initWithWeather:date
                                                  forcast:weather
                                                     icon:icon]];
    }
    [_db close];
}
-(void)delete{
    _sql = @"DELETE FROM Weather_Table";
    [_db open];
    [_db executeUpdate:_sql];
    [_db class];
}
@end
