//
//  ViewController.m
//  ex2-1-13
//
//  Created by ryota on 2017/01/09.
//  Copyright © 2017年 ryota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectView;

@end

@implementation ViewController{
    NSDictionary *Sanrio;
    NSDictionary *Disney;
    UIImage *image;
    CGFloat collectSize;
    NSDictionary *dic;
    NSString *name;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return dic.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [Disney[@"names"]count]*2;
            break;
        
        case 1:
            return [Sanrio[@"names"]count]*2;
            break;
        default:
            return 0;
            break;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                     forIndexPath:indexPath];
    int myRow;
    
    if ((myRow = indexPath.row % 2)) {
    switch (indexPath.section) {
        case 0:
            image = [UIImage imageNamed: Disney[@"images"][indexPath.row/2]];
            cell.backgroundColor =[UIColor redColor];
            break;
        case 1:
            
            image = [UIImage imageNamed: Sanrio[@"images"][indexPath.row/2]];
            cell.backgroundColor =[UIColor blueColor];
            break;
            
        default:
            break;
    }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = imageView.frame;
        frame.size.width = collectSize;
        frame.size.height = collectSize;
        imageView.frame = frame;
        
        [cell addSubview:imageView];
    }else{
        switch (indexPath.section) {
            case 0:
                 name = Disney[@"names"][indexPath.row/2];
                break;
            case 1:
                name = Sanrio[@"names"][indexPath.row/2];
                break;
                
            default:
                break;
        }
        UILabel *label = [[UILabel alloc]init];
        label.text = name;
        
        CGRect frame = label.frame;
        frame.size.width = collectSize;
        frame.size.height = collectSize;
        label.frame = frame;
        
        [cell addSubview:label];
    }

    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    collectSize= self.collectView.frame.size.width/4-3*4;
    return CGSizeMake(collectSize, collectSize);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [_collectView    registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    dic = [NSDictionary dictionaryWithContentsOfFile:path];
    Disney = [dic objectForKey:@"Disney"];
    Sanrio = [dic objectForKey:@"Sanrio"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

