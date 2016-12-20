//
//  main.m
//  ex1-1-3
//
//  Created by ryota on 2016/12/19.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sample = 0;
        NSArray *testArrs = @[@"value1",@"value2",@"value3"];
        // insert code here...
        
        if(sample==10){
            NSLog(@"%d", sample);
        }
        
        if(sample==0){
            NSLog(@"値は0です");
        }else{
            NSLog(@"値は0以外です");
        }
        
        
        if (sample<10) {
            NSLog(@"値は10より小さいです");
        }else if(sample==10){
            NSLog(@"値は10です");
        }else{
            NSLog(@"値は10以上です");
        }
        
        sample==0 ? NSLog(@"値は0です") : NSLog(@"値は10以上です");
        
        
        for (int i;i<10;i++){
            NSLog(@"%zd",i);
        }
        
        for (NSString *testArr in testArrs){
            NSLog(@"%@",testArr);
        }
        switch (sample) {
            case 0:
                NSLog(@"0です");
                break;
                
            case 1:
                NSLog(@"1です");
            default:
                break;
        }
    }
    return 0;
}
