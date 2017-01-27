//
//  ListSeter.h
//  ex2-3-2
//
//  Created by ryota on 2017/01/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListSeter : NSObject
@property NSInteger todo_id;
@property NSString *todo_title;
@property NSDate *limit_date;
@property BOOL delete_flg;
-(id)initWithData:(NSInteger)todo_id
            title:(NSString *)todo_title
         contents:(NSString *)todo_contents
            limit:(NSDate *)limit_date;
@end
