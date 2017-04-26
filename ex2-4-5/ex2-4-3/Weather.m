//
//  Weather.m
//  
//
//  Created by ryota on 2017/04/19.
//
//

#import "Weather.h"

@implementation Weather
-(id)initWithWeather:(NSString *)date forcast:(NSString *)forecast icon:(NSString *)icon{
    if(self = [super init]){
        self.date = date;
        self.forecast = forecast;
        self.icon = icon;
    }
    return self;
}
@end
