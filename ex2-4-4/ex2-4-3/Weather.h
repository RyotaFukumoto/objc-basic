//
//  Weather.h
//  
//
//  Created by ryota on 2017/04/19.
//
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
@property NSString* date;
@property NSString* forecast;
@property NSString* icon;
-(id)initWithWeather:(NSString*)date forcast:(NSString*)forecast icon:(NSString*)icon;
@end
