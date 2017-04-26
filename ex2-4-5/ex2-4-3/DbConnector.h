//
//  DbConnector.h
//  ex2-4-3
//
//  Created by ryota on 2017/04/19.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface DbConnector : NSObject
@property     NSString *databasePath;
@property  NSMutableArray<Weather*> *list;
-(void)pathSet;
-(void)creater;
-(void)selector;
-(id)initWithName:(NSString*) dbName;
-(void)insertor:(Weather*)weather;

@end
