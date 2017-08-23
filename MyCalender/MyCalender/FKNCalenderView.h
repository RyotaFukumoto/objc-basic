//
//  FKNCalenderView.h
//  MyCalender
//
//  Created by ryota on 2017/08/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionViewDelegate <NSObject>
- (void)setSelectedDate:(NSDate *)selectedDate;
@end

@interface FKNCalenderView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    id<CollectionViewDelegate>delegate2;
}

@property(nonatomic, retain) id<CollectionViewDelegate> delegate2;
@property (nonatomic, strong) NSDate *selectedDate;

-(void)lastMonthSwitch;
-(void)nextMonthSwitch;
@end
