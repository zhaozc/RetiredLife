//
//  InfoTableView.h
//  RetiredLife
//
//  Created by Water on 15/9/6.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InfoTableViewDelegate <NSObject>
-(void)infoTableCellSelectRowAtIndexPath:(NSString *)infoTitle withCategoryIndex:(int)categoryIndex nsIndexPath:(NSIndexPath *)indexPath;
@end
@interface InfoTableView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *infoAry;
@property (nonatomic, strong) UITableView *infoListTableView;
@property (nonatomic, strong) UIViewController *infoViewController;
@property (nonatomic, assign) id<InfoTableViewDelegate> delegate;

@property int categoryIndex;
-(void)setCategory;
@end
