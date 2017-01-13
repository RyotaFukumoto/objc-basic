//
//  ViewController.h
//  ex2-1-16
//
//  Created by ryota on 2017/01/13.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
@interface ViewController : UIViewController<UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *page;
@end

