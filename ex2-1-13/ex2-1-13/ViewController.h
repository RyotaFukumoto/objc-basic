//
//  ViewController.h
//  ex2-1-13
//
//  Created by ryota on 2017/01/09.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
typedef NS_ENUM(NSInteger,hederNum){
    Disney,
    Sanrio
};


@end

