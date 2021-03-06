//
//  DbConnect.h
//  ex2-3-2
//
//  Created by ryota on 2017/01/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListSeter.h"
@interface DbConnect : NSObject
@property NSMutableArray<ListSeter *> *todoList;
@property     NSString *databasePath;
-(void)pathSet;
-(void)creater;
-(id)initWithName:(NSString*) dbName;
-(void)insertor:(NSString*)todo_title
       contents:(NSString *)todo_contents
          limit:(NSDate *)limit_date;
-(void)selector;
-(void)deleter:(NSInteger)todo_id;
@end
