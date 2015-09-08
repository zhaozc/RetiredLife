//
//  PersonalView.m
//  RetiredLife
//
//  Created by Water on 15/9/7.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "PersonalView.h"
#import "Retired-Define.h"
@implementation PersonalView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor  = [UIColor whiteColor];
        CustomTitleView *m_titleView  = [[CustomTitleView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 35) withTitle:@"（二）个人信息"];
        [self addSubview:m_titleView];
        
        NSArray *tempAry = [NSArray arrayWithObjects:@"性别：",@"出生日期：",@"民族：",@"宗教信仰：",@"婚姻状况：",@"籍贯：",@"户籍地址：", nil];
        
        for (int i = 0 ; i < tempAry.count; i ++)
        {
            //标签
            UILabel *idDetailLabel  = [[UILabel alloc] init];
            idDetailLabel.frame = CGRectMake(15, 45+ 45 *i, 110, 35);
            idDetailLabel.backgroundColor = [UIColor clearColor];
            idDetailLabel.textAlignment = NSTextAlignmentLeft;
            idDetailLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
            idDetailLabel.text = [tempAry objectAtIndex:i];
            [self addSubview:idDetailLabel];
            
            //线
            UIImageView *lineFirstView = [[UIImageView alloc] initWithFrame:CGRectMake(80, idDetailLabel.bottom , self.frame.size.width - 96, 1)];
            lineFirstView.backgroundColor = [UIColor purpleColor];
            [self addSubview:lineFirstView];
        }


        
        //保存本地
        UIButton *saveDataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveDataBtn.backgroundColor = [UIColor redColor];
        saveDataBtn.layer.cornerRadius =3.0f;
        [saveDataBtn addTarget:self action:@selector(saveDataToLocal) forControlEvents:UIControlEventTouchUpInside];
        [saveDataBtn setTitle:@"保存信息到本地" forState:UIControlStateNormal];
        saveDataBtn.frame = CGRectMake(20,  25, self.frame.size.width - 40, 30);
//        [self addSubview:saveDataBtn];
    }
    return self;
}

//保存数据到本地
-(void)saveDataToLocal
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
