//
//  HMImageLoopController.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMImageLoopController.h"
#import "HMHeadline.h"
@interface HMImageLoopController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;
@property (nonatomic, strong) NSArray *headlines;
@end

@implementation HMImageLoopController
//使用collectionView注意
//1 必须设置flowLayout
//2 必须注册cell（从sb中加载cell，注册自定义cell，注册xib）

- (void)setHeadlines:(NSArray *)headlines {
    _headlines = headlines;
    //重新加载colletionView
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [HMHeadline headlinesWithSuccess:^(NSArray *array) {
        self.headlines = array;
    } error:^{
        NSLog(@"出错了");
    }];
    
    //设置flowlayout
    [self setCollectionViewStyle];
}
//设置colletionview的样式
- (void)setCollectionViewStyle {
    self.flowlayout.itemSize = self.collectionView.frame.size;
    self.flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowlayout.minimumInteritemSpacing = 0;
    self.flowlayout.minimumLineSpacing = 0;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}

//数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.headlines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headline" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
