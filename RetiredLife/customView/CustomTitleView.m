//
//  CustomTitleView.m
//  RetiredLife
//
//  Created by Water on 15/9/6.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "CustomTitleView.h"

@implementation CustomTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)titleStr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        //标签
        UILabel *idLabel  = [[UILabel alloc] init];
        idLabel.frame = CGRectMake(8, 0, frame.size.width,35 );
        idLabel.backgroundColor = [UIColor clearColor];
        idLabel.adjustsFontSizeToFitWidth = YES;
        idLabel.textAlignment = NSTextAlignmentLeft;
        idLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        idLabel.text = titleStr;
        [self addSubview:idLabel];

    }
    return self;
}

@end
