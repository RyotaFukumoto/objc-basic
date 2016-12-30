//
//  OverlayView.m
//  ex2-1-8
//
//  Created by ryota on 2016/12/30.
//  Copyright © 2016年 ryota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OverlayView.h"

@implementation OverlayView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_target performSelector:_action withObject:self afterDelay:0.0f];
}
@end
