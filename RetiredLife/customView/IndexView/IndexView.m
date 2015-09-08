//
//  IndexView.m
//  RetiredLife
//
//  Created by Water on 15/9/5.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "IndexView.h"
#import "UIViewExt.h"
@implementation IndexView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor whiteColor];
//        标题
        UILabel *titleLabel  = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 2, self.frame.size.width, 40);
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont fontWithName:@"" size:15.0f];
        titleLabel.text = @"北京养老服务评估报告表";
        [self addSubview:titleLabel];
        
// 线
        UIImageView *lineFirstView = [[UIImageView alloc] initWithFrame:CGRectMake(8, titleLabel.bottom, self.frame.size.width - 16, 1)];
        lineFirstView.backgroundColor = [UIColor purpleColor];
        [self addSubview:lineFirstView];
   
//       评估编号
        UILabel *evaluatLabel  = [[UILabel alloc] init];
        evaluatLabel.frame = CGRectMake(15, lineFirstView.bottom + 15, 78, 35);
        evaluatLabel.backgroundColor = [UIColor clearColor];
        evaluatLabel.adjustsFontSizeToFitWidth = YES;
        evaluatLabel.textAlignment = NSTextAlignmentCenter;
        evaluatLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        evaluatLabel.text = @"评估编号：";
        [self addSubview:evaluatLabel];
        
//    填表日期
        UILabel *formLabel  = [[UILabel alloc] init];
        formLabel.frame = CGRectMake(15, evaluatLabel.bottom + 20, 78, 35);
        formLabel.backgroundColor = [UIColor clearColor];
        formLabel.adjustsFontSizeToFitWidth = YES;
        formLabel.textAlignment = NSTextAlignmentCenter;
        formLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        formLabel.text = @"填表日期：";
        [self addSubview:formLabel];
        
//      评估编号输入框
        _evalueTextFiels=[[UITextField alloc]initWithFrame:CGRectMake(evaluatLabel.right + 15, lineFirstView.bottom + 15, self.frame.size.width - evaluatLabel.right -30, 30)];
        _evalueTextFiels.borderStyle=UITextBorderStyleNone;
        _evalueTextFiels.layer.cornerRadius=3.0f;
        _evalueTextFiels.layer.masksToBounds=YES;
        _evalueTextFiels.backgroundColor=[UIColor whiteColor];
        _evalueTextFiels.layer.borderColor=[[UIColor blackColor]CGColor];//边框颜色
        _evalueTextFiels.layer.borderWidth= 1.0f;
        [self addSubview:_evalueTextFiels];
        
        
        // 评估编号输入框
        _formTextFiels=[[UITextField alloc]initWithFrame:CGRectMake(formLabel.right + 15, evaluatLabel.bottom + 20, self.frame.size.width - formLabel.right - 30, 30)];
        _formTextFiels.borderStyle=UITextBorderStyleNone;
        _formTextFiels.layer.cornerRadius=3.0f;
        _formTextFiels.layer.masksToBounds=YES;
        _formTextFiels.backgroundColor=[UIColor whiteColor];
        _formTextFiels.layer.borderColor=[[UIColor blackColor]CGColor];//边框颜色
        _formTextFiels.layer.borderWidth= 1.0f;
        [self addSubview:_formTextFiels];
       
//线
        UIImageView *lineTwoFirstView = [[UIImageView alloc] initWithFrame:CGRectMake(8, _formTextFiels.bottom + 15, self.frame.size.width - 16, 1)];
        lineTwoFirstView.backgroundColor = [UIColor purpleColor];
        [self addSubview:lineTwoFirstView];
        
// checkbox
        float c_height = 0.0;
        NSArray *checkAry = [NSArray arrayWithObjects:@"本人承诺所提供的信息真实、准确",@"本人同意使用本评估表的名字、地址、电话等信息用于通知等事项",@"本人同意使用在评估及相关活动中拍摄的图片和影像", nil];
        for (int i = 0; i < [checkAry count]; i ++)
        {
            UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            checkBtn.backgroundColor = [UIColor redColor];
            checkBtn.frame = CGRectMake(20, lineTwoFirstView.bottom + 25 + 40 * i, 30, 30);
            checkBtn.tag = 100 + i;
//            [checkBtn setImage:[]forState:UIControlStateNormal];
            [self addSubview:checkBtn];
            
            UILabel *checkTitleLabel  = [[UILabel alloc] init];
            if (0 == i) {
                checkTitleLabel.frame = CGRectMake(checkBtn.right + 15, lineTwoFirstView.bottom +  25 + 40 * i, self.frame.size.width - checkBtn.right - 30, 35);
            }else if(1 == i)
            {
                checkTitleLabel.numberOfLines = 2;
                checkTitleLabel.frame = CGRectMake(checkBtn.right + 15, lineTwoFirstView.bottom +  25 + 25 * i , self.frame.size.width - checkBtn.right - 30, 35*2);
            }else
            {
                checkTitleLabel.numberOfLines = 2;
                checkTitleLabel.frame = CGRectMake(checkBtn.right + 15, lineTwoFirstView.bottom +  25 + 37 * i , self.frame.size.width - checkBtn.right - 30, 35*2);
                c_height = checkTitleLabel.bottom;
            }
            checkTitleLabel.backgroundColor = [UIColor clearColor];
            checkTitleLabel.adjustsFontSizeToFitWidth = YES;
            checkTitleLabel.textAlignment = NSTextAlignmentLeft;
            checkTitleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
            checkTitleLabel.text = [checkAry objectAtIndex:i];
            [self addSubview:checkTitleLabel];
        }
        
//       签字
        UILabel *signLabel  = [[UILabel alloc] init];
        signLabel.frame = CGRectMake(15, c_height, 150, 35);
        signLabel.backgroundColor = [UIColor clearColor];
        signLabel.adjustsFontSizeToFitWidth = YES;
        signLabel.textAlignment = NSTextAlignmentCenter;
        signLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        signLabel.text = @"申请人/代理人签字：";
        [self addSubview:signLabel];
        
        // 评估编号输入框
        _signTextFiels=[[UITextField alloc]initWithFrame:CGRectMake(signLabel.right + 5, c_height, self.frame.size.width - signLabel.right - 20, 30)];
        _signTextFiels.borderStyle=UITextBorderStyleNone;
        _signTextFiels.layer.cornerRadius=3.0f;
        _signTextFiels.layer.masksToBounds=YES;
        _signTextFiels.backgroundColor=[UIColor whiteColor];
        _signTextFiels.layer.borderColor=[[UIColor blackColor]CGColor];//边框颜色
        _signTextFiels.layer.borderWidth= 1.0f;
        [self addSubview:_signTextFiels];

        //      保存本地
        UIButton *saveDataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveDataBtn.backgroundColor = [UIColor redColor];
        saveDataBtn.layer.cornerRadius =3.0f;
        [saveDataBtn addTarget:self action:@selector(saveDataToLocal) forControlEvents:UIControlEventTouchUpInside];
        [saveDataBtn setTitle:@"保存信息到本地" forState:UIControlStateNormal];
        saveDataBtn.frame = CGRectMake(20, signLabel.bottom + 25, self.frame.size.width - 40, 30);
        [self addSubview:saveDataBtn];
       
        //      保存本地并上传
        UIButton *saveAndUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveAndUpBtn.backgroundColor = [UIColor redColor];
        [saveAndUpBtn addTarget:self action:@selector(saveLocalAndUpLoadData) forControlEvents:UIControlEventTouchUpInside];
        saveAndUpBtn.layer.cornerRadius =3.0f;
        [saveAndUpBtn setTitle:@"保存信息并上传" forState:UIControlStateNormal];
        saveAndUpBtn.frame = CGRectMake(20, saveDataBtn.bottom + 10 , self.frame.size.width - 40, 30);
        [self addSubview:saveAndUpBtn];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_signTextFiels resignFirstResponder];
    [_evalueTextFiels resignFirstResponder];
    [_formTextFiels resignFirstResponder];
    
}
//点击checkbox事件
-(void)checkBtnAction:(UIButton *)checkBtn
{
    
}

//保存数据到本地
-(void)saveDataToLocal
{
    
}

//保存数据并上传
-(void)saveLocalAndUpLoadData
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
