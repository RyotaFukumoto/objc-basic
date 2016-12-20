//
//  Account.h
//  ex1-1-4
//
//  Created by ryota on 2016/12/20.
//  Copyright © 2016年 ryota. All rights reserved.
//


#ifndef Account_h
#define Account_h
#endif 
#import <Foundation/Foundation.h>

@interface Account : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic) NSInteger age;
@property(nonatomic,copy) NSString *sex;
@property(nonatomic,copy) NSString *language;

-(id)initWithName :(NSString*)name :(NSInteger)age :(NSString*)sex :(NSString*)language;

-(void)print;
@end
