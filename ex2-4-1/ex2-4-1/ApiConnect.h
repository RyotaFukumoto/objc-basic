//
//  ApiConnect.h
//  ex2-4-1
//
//  Created by ryota on 2017/01/31.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiConnect : NSObject
@property NSString* path;
-(id)initWithPath:(NSString*)path;
-(void)getJson:(NSInteger)date;
@end
