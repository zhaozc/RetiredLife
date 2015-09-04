//
//  AddEvaluationViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/4.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "AddEvaluationViewController.h"
#import "PPiFlatSegmentedControl.h"
#import "Retired-Define.h"
#import "IndexViewController.h"
#import "BasicInfoViewController.h"
#import "EvaluatInfoViewController.h"
#import "SupplementaryModleViewController.h"
@interface AddEvaluationViewController ()
@property (nonatomic, strong) IndexViewController *m_indexVCtrl;
@property (nonatomic, strong) BasicInfoViewController *m_baseicInfoVCtrl ;
@property (nonatomic, strong) EvaluatInfoViewController *m_evalueatInfoVCtrl;
@property (nonatomic, strong) SupplementaryModleViewController *m_supplyModleVCtrl ;
@property (nonatomic, strong) UIView *fatherView;

@end

@implementation AddEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加view
    [self creatUI];
}


-(void)creatUI
{
    //菜单选择view
    PPiFlatSegmentedControl *segmented=[[PPiFlatSegmentedControl alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT+20, MAIN_SCREEN_WIDTH, 30) items:@[  @{@"text":@"主页"},
                                                                                                                                                                 @{@"text":@"基本信息"}, @{@"text":@"评估信息"},@{@"text":@"补充模块"}]
                                                                         iconPosition:IconPositionRight andSelectionBlock:^(NSUInteger segmentIndex) {
                                                                             [self switchViews:segmentIndex];
                                                                         }];
    segmented.borderWidth=0.5;
    segmented.borderColor=[UIColor darkGrayColor];//segment边框颜色
    segmented.textAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                               NSForegroundColorAttributeName:[UIColor grayColor]};//默认字体颜色
    segmented.selectedTextAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                       NSForegroundColorAttributeName:[UIColor redColor]};//选择状态字体颜色
    [self.view addSubview:segmented];
    
    //初始化各个UI模块
    _m_indexVCtrl = [[IndexViewController alloc] init];//主页
    _m_baseicInfoVCtrl  = [[BasicInfoViewController alloc] init];    //基本信息
    _m_evalueatInfoVCtrl = [[EvaluatInfoViewController alloc]init];  //评估信息
    _m_supplyModleVCtrl = [[SupplementaryModleViewController alloc] init];//补充模块
    
    _fatherView = [[UIView alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT+50, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT -TOOLBAR_HEIGHT-50 )];
    [self.view addSubview:_fatherView];
    
    [_fatherView addSubview:_m_indexVCtrl.view];
    [_fatherView addSubview:_m_baseicInfoVCtrl.view];
    [_fatherView addSubview:_m_evalueatInfoVCtrl.view];
    [_fatherView addSubview:_m_supplyModleVCtrl.view];
    [self switchViews:0];
}

//选择不同模块
- (void)switchViews:(NSInteger)segmentIndex
{
    UIView *chosenView = nil;
    switch (segmentIndex) {
        case 0:
            chosenView = _m_indexVCtrl.view;
            break;
        case 1:
            chosenView = _m_baseicInfoVCtrl.view;
            break;
        case 2:
            chosenView = _m_evalueatInfoVCtrl.view;
            break;
        case 3:
            chosenView = _m_supplyModleVCtrl.view;
            break;
        default:
            break;
    }
    if (chosenView) {
        [_fatherView bringSubviewToFront:chosenView];
    }

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
