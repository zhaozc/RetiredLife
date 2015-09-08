//
//  IDInfoViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/6.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "IDInfoViewController.h"
#import "UIViewExt.h"
#import "CustomTitleView.h"
#import "Retired-Define.h"
@interface IDInfoViewController ()
@property (nonatomic, strong) NSArray *idAry;

@end

@implementation IDInfoViewController
@synthesize idTitleStr = _idTitleStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _idAry = [NSArray arrayWithObjects:@"姓名：",@"曾用名：",@"身份证号：",@"医保卡号：",@"残疾军人证号：",@"残疾人证号：", nil];
    // Do any additional setup after loading the view.
    [self creatUI];
}

//添加UI视图
-(void)creatUI
{
    CustomTitleView *m_titleView  = [[CustomTitleView alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT+20, MAIN_SCREEN_WIDTH, 35) withTitle:_idTitleStr];
    [self.view addSubview:m_titleView];
    
    float getY  = 0.0f;
    for (int i = 0 ; i < _idAry.count; i ++) {
        //标签
        UILabel *idDetailLabel  = [[UILabel alloc] init];
        idDetailLabel.frame = CGRectMake(15, m_titleView.bottom + 35 *i, 110, 35);
        idDetailLabel.backgroundColor = [UIColor clearColor];
//    idDetailLabel.adjustsFontSizeToFitWidth = YES;
        idDetailLabel.textAlignment = NSTextAlignmentLeft;
        idDetailLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15.0f];
        idDetailLabel.text = [_idAry objectAtIndex:i];
        [self.view addSubview:idDetailLabel];
        
        //标签对应输入框
        UITextField *inputTextField=[[UITextField alloc]initWithFrame:CGRectMake(idDetailLabel.right + 15,m_titleView.bottom + 5+ 35 *i, self.view.frame.size.width - idDetailLabel.right -30, 30)];
        inputTextField.borderStyle=UITextBorderStyleNone;
        inputTextField.layer.cornerRadius=3.0f;
        inputTextField.layer.masksToBounds=YES;
        inputTextField.backgroundColor=[UIColor whiteColor];
        inputTextField.layer.borderColor=[[UIColor blackColor]CGColor];//边框颜色
        inputTextField.layer.borderWidth= 1.0f;
        [self.view addSubview:inputTextField];
        
        if ( i  == (_idAry.count - 1)) {
            getY = inputTextField.bottom;
        }
    }
    
    //保存本地
    UIButton *saveDataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveDataBtn.backgroundColor = [UIColor redColor];
    saveDataBtn.layer.cornerRadius =3.0f;
    [saveDataBtn addTarget:self action:@selector(saveDataToLocal) forControlEvents:UIControlEventTouchUpInside];
    [saveDataBtn setTitle:@"保存信息到本地" forState:UIControlStateNormal];
    saveDataBtn.frame = CGRectMake(20, getY + 45, MAIN_SCREEN_WIDTH - 40, 30);
    [self.view addSubview:saveDataBtn];
}

-(void)saveDataToLocal
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
