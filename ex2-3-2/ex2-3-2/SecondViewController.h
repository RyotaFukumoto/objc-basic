//
//  SecondViewController.h
//  ex2-3-2
//
//  Created by ryota on 2017/01/18.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"
@interface SecondViewController : UIViewController<UITextFieldDelegate>
@property DbConnect *connect;
@end
