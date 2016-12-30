//
//  OverlayView.h
//  ex2-1-8
//
//  Created by ryota on 2016/12/30.
//  Copyright © 2016年 ryota. All rights reserved.
//

#ifndef OverlayView_h
#define OverlayView_h
#import <UIKit/UIKit.h>

@interface OverlayView : UIView
@property(nonatomic, weak) id target;
@property(nonatomic, assign) SEL action;
@end


#endif /* OverlayView_h */
