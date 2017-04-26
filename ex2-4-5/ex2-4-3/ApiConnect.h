//
//  ApiConnect.h
//  ex2-4-1
//
//  Created by ryota on 2017/01/31.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiConnectDelegate <NSObject>

@required
-(void)finish:(NSArray*)forecasts;

@end


@interface ApiConnect : NSObject{
    id<ApiConnectDelegate> delegate;
}

@property NSString* path;
@property(nonatomic,retain)id<ApiConnectDelegate>delegate;
-(id)initWithPath:(NSString*)path;
-(NSString*) getText;
-(NSInteger)contentCcount;
-(void)forecast;
@end
