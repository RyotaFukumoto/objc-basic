//
//  ListSeter.m
//  ex2-3-2
//
//  Created by ryota on 2017/01/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ListSeter.h"
@interface ListSeter()
@end
@implementation ListSeter
-(id)initWithData:(NSInteger)todo_id
            title:(NSString *)todo_title
         contents:(NSString *)todo_contents
            limit:(NSDate *)limit_date{
    if(self = [super init]){
        self.todo_id = todo_id;
        self.todo_title = todo_title;
        self.limit_date = limit_date;
        _delete_flg = NO;
    }
    
    return self;
}
@end
