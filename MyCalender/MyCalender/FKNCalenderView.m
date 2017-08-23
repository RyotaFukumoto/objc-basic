//
//  FKNCalenderView.m
//  MyCalender
//
//  Created by ryota on 2017/08/23.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "FKNCalenderView.h"
#import "FKNDayCell.h"

@implementation NSDate (Extension)

/**
 *  Return the date one month before the receiver.
 *
 *  @return  date
 */
- (NSDate *)monthAgoDate
{
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

/**
 *  Return the date one month after the receiver.
 *
 *  @return  date
 */
- (NSDate *)monthLaterDate
{
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end

static NSString* weekADay[7] = {@"日",@"月",@"火",@"水",@"木",@"金",@"土"};

static NSString* const ReuseIdentifier = @"Cell";

static NSUInteger const DaysPerWeek = 7;

static CGFloat const CellMargin = 2.0f;




@implementation FKNCalenderView
@synthesize delegate2;


-(void)lastMonthSwitch{
    self.selectedDate = [self.selectedDate monthAgoDate];
    
    [self reloadData];
    [delegate2 setSelectedDate:_selectedDate];
}


-(void)nextMonthSwitch{
    self.selectedDate = [self.selectedDate monthLaterDate];
    
    [self reloadData];
    [delegate2 setSelectedDate:_selectedDate];
}


- (NSDate *)firstDateOfMonth
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                   fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}

/**
 *  return date for specified indexPath
 *
 *  @param indexPath cell's indexPath
 *
 *  @return date
 */
- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath
{
    // calculate the ordinal number of first day
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:self.firstDateOfMonth];
    
    // calculate the difference between "day number of cell at indexPath" and "day number of first day"
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:self.firstDateOfMonth
                                                                options:0];
    return date;
}

#pragma mark - UICollectionViewDataSource methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    if(section == 0 ){
        return DaysPerWeek;
    }else{
        // calculate number of weeks
        NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                                  inUnit:NSCalendarUnitMonth
                                                                 forDate:self.firstDateOfMonth];
        NSUInteger numberOfWeeks = rangeOfWeeks.length;
        NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
        
        return numberOfItems;
    }
}

-(UIColor *)weekAColor:(NSInteger)indexPath{
    if(indexPath % DaysPerWeek == 0){
        return [UIColor redColor];
    }else if(indexPath % DaysPerWeek == 6){
        return [UIColor blueColor];
    }else{
        return [UIColor blackColor];
        
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FKNDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier
                                                              forIndexPath:indexPath];
    if(indexPath.section == 0){
        cell.label.text = weekADay[indexPath.row];
    }else{
        NSDateFormatter *formatter = [NSDateFormatter new];
        formatter.dateFormat = @"d";
        cell.label.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
        
    }
    cell.label.textColor = [self weekAColor:indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 1.5f;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CellMargin, CellMargin, CellMargin, CellMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}

@end

