//
//  ViewController.m
//  ex2-1-12
//
//  Created by ryota on 2017/01/05.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectView;

@end

@implementation ViewController{
    NSArray *image;
    CGFloat collectSize;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section{
    return [image count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                     forIndexPath:indexPath];
    UIImageView *imageView = [cell.contentView viewWithTag:1];
    imageView.image = [UIImage imageNamed:image[indexPath.row]];
    CGRect frame = imageView.frame;
    frame.size.width = collectSize;
    frame.size.height = collectSize;
    imageView.frame = frame;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    collectSize= self.collectView.frame.size.width/3-3*3;
    return CGSizeMake(collectSize, collectSize);
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [_collectView    registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    image = [dic objectForKey:@"images"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
@end
