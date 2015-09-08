//
//  IndexView.h
//  RetiredLife
//
//  Created by Water on 15/9/5.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IndexViewDelegate <NSObject>
@end
@interface IndexView : UIView
@property (nonatomic, assign) id<IndexViewDelegate> delegate;
@property (nonatomic, strong) UITextField *evalueTextFiels;
@property (nonatomic, strong) UITextField *formTextFiels;
@property (nonatomic, strong) UITextField *signTextFiels;


@end
