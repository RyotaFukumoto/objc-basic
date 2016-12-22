//
//  FavoriteProgrammingLanguage.m
//  ex1-1-5
//
//  Created by ryota on 2016/12/21.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"
@implementation FavoriteProgrammingLanguage


-(void)joinInternship{
    NSLog(@"インターンシップに参加");
    if ([self.delegate respondsToSelector:@selector(canObjC)]) {
        
        [self.delegate canObjC];
        
    }
    
}
@end

