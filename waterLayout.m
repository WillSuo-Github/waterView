//
//  waterLayout.m
//  waterView
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "waterLayout.h"

@interface waterLayout ()

@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, assign) NSInteger columnCount;

@end

@implementation waterLayout

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    
//    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    att.size = CGSizeMake(44, 44);
//    att.center = CGPointMake(100, 100);
//    return att;
//}

- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.itemMargin = 10;
    
    self.columnCount = [self.dataSource numberOfColumnsInFlowLayout:self];
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *AllAttArr = [NSMutableArray array];
    
    NSMutableArray<NSMutableArray<NSNumber *> *> *columnsHeightArr = [NSMutableArray array];
    for (int i = 0; i < self.cellCount; ++i) {

        CGFloat itemX = 0;
        CGFloat itemY = 0;
        CGFloat itemW = 0;
        CGFloat itemH = 0;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        itemW = (self.collectionView.bounds.size.width - (_columnCount - 1) * _itemMargin) / _columnCount;
        itemX = (i % _columnCount) * (_itemMargin + itemW);
        itemH = [self.dataSource heightForItemAtIndexPath:indexPath inFlowLayout:self];
        
        
        if (columnsHeightArr.count <= (i % _columnCount)) {
            [columnsHeightArr addObject:[NSMutableArray array]];
        }
        
        for (int j = 0; j < columnsHeightArr[i % _columnCount].count; ++j) {
            itemY += (columnsHeightArr[i % _columnCount][j].floatValue + 10);
        }
        
        [columnsHeightArr[i % _columnCount] addObject:[NSNumber numberWithFloat:itemH]];
        
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        att.frame = CGRectMake(itemX, itemY, itemW, itemH);
        [AllAttArr addObject:att];
    }
    
//    NSLog(@"%@",[tmpArr filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
//    }]]);
    
//    return [tmpArr filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
//    }]];
    return AllAttArr;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return NO;
}

- (CGSize)collectionViewContentSize{
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 10000);
}

@end
