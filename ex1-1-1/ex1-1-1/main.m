//
//  main.m
//  ex1-1-1
//
//  Created by ryota on 2016/12/19.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        BOOL BOY = YES;
        NSString *STR = @"ABC";
        NSInteger ITG = 1234;
        float FLT = 123.567f;
        
        
        // insert code here...
        NSLog(@"%hhd", BOY);
        NSLog(@"%@", STR);
        NSLog(@"%zd", (long)ITG); //%zd 環境に依存しない
        NSLog(@"%0.3f",FLT);
    }
    return 0;
}
