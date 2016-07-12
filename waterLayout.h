//
//  waterLayout.h
//  waterView
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
@class waterLayout;

@protocol waterLayoutDataSource <NSObject>

@required
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath inFlowLayout:(waterLayout *)Layout;
- (NSInteger)numberOfColumnsInFlowLayout:(waterLayout *)Layout;

@end

@interface waterLayout : UICollectionViewLayout



@property (nonatomic, assign) CGFloat itemMargin;

@property (nonatomic, weak) id<waterLayoutDataSource> dataSource;

@end
