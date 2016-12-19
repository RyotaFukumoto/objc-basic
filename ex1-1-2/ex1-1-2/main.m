//
//  main.m
//  ex1-1-2
//
//  Created by ryota on 2016/12/19.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *testArr = @[@"value1",@"value2",@"value3"];
        NSDictionary *testDT = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
        
        NSLog(@"%@", testArr);
        NSLog(@"%@", testDT);
    }
    return 0;
}
