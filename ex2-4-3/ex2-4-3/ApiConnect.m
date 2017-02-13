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
@property NSArray *forecasts;
@property NSString *text;

@end

@implementation ApiConnect
@synthesize delegate;
-(id)initWithPath:(NSString*)path{
    if(self = [super init]){
        _path = path;
    }
    
    return self;
}

-(void)forecast{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:_path
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             _forecasts = responseObject[@"forecasts"];
             NSDictionary *description = responseObject[@"description"];
             _text = description[@"text"];
             if ([self.delegate respondsToSelector:@selector(finish:)]){
                 [delegate finish:_forecasts];
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}
-(NSString*) getText{
    return _text;
}
-(NSInteger)contentCcount{
    return     _forecasts.count;
}

@end
