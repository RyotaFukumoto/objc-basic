//
//  ApiConnect.m
//  ex2-4-1
//
//  Created by ryota on 2017/01/31.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ApiConnect.h"
#import "AFNetworking.h"
@interface ApiConnect()
@end

@implementation ApiConnect
-(id)initWithPath:(NSString*)path{
    if(self = [super init]){
     _path = path;
    }
    
    return self;
}

-(void)getJson:(NSInteger)date{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:_path
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSArray *forecasts = responseObject[@"forecasts"];
             NSDictionary *data = forecasts[date];
             NSLog(@"%@ %@",data[@"dateLabel"],data[@"telop"]);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             // エラーの場合はエラーの内容をコンソールに出力する
             NSLog(@"Error: %@", error);
         }];
}

@end
