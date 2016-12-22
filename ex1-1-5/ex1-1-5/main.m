//
//  main.m
//  ex1-1-5
//
//  Created by ryota on 2016/12/21.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "FavoriteProgrammingLanguage.h"
int main(int argc, const char * argv[]) {
        @autoreleasepool {
            NSArray<Account *> *accounts = @[[[Account alloc]initWithName:@"今田" :21 :@"男性" :@"日本語"],
                                             [[Account alloc]initWithName:@"中村" :21 :@"男性" :@"日本語"],
                                             [[Account alloc]initWithName:@"林" :21 :@"男性" :@"日本語"]];
            for(Account *account in accounts){
                [account joinDo];
            }
    }
    return 0;
}
