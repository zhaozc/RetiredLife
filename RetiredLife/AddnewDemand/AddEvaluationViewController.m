//
//  AddEvaluationViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/4.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "AddEvaluationViewController.h"
#import "Retired-Define.h"


@interface AddEvaluationViewController ()<InfoTableViewDelegate>

@property (nonatomic, strong) UIView *fatherView;
@property (nonatomic, strong) IndexView *indexView;
@property (nonatomic, strong) InfoTableView *baseicInfoView;
@property (nonatomic, strong) InfoTableView *evalutInfoView;
@property (nonatomic, strong) InfoTableView *sypplyInfoView;

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
    
    _fatherView = [[UIView alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT+50, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT -TOOLBAR_HEIGHT-50 )];
    [self.view addSubview:_fatherView];

    
       //初始化各个UI模块
    //主页
    _indexView = [[IndexView alloc] initWithFrame:CGRectMake(0 , 0 , MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    
    //基本信息
    _baseicInfoView = [[InfoTableView alloc]initWithFrame:CGRectMake(0 , 0 , MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    
     //评估信息
   _evalutInfoView = [[InfoTableView alloc]initWithFrame:CGRectMake(0 , 0 , MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    
    //补充模块
    _sypplyInfoView = [[InfoTableView alloc]initWithFrame:CGRectMake(0 , 0 , MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    
    _baseicInfoView.delegate = self;
    _evalutInfoView.delegate = self;
    _sypplyInfoView.delegate = self;
    _baseicInfoView.categoryIndex = 1;
     _evalutInfoView.categoryIndex = 2;
     _sypplyInfoView.categoryIndex = 3;
    
    [_baseicInfoView setCategory];
    [_evalutInfoView setCategory];
    [_sypplyInfoView setCategory];
    
    [_fatherView addSubview:_indexView];
    [_fatherView addSubview:_baseicInfoView];
    [_fatherView addSubview:_evalutInfoView];
    [_fatherView addSubview:_sypplyInfoView];
    [self switchViews:0];
}

//选择不同模块
- (void)switchViews:(NSInteger)segmentIndex
{
    UIView *chosenView = nil;
    switch (segmentIndex) {
        case 0:
            chosenView = _indexView;//主页
            break;
        case 1:
            chosenView = _baseicInfoView;//基本
            break;
        case 2:
            chosenView = _evalutInfoView;//评估
            break;
        case 3:
            chosenView = _sypplyInfoView;//补充
            break;
        default:
            break;
    }
    if (chosenView) {
        [_fatherView bringSubviewToFront:chosenView];
    }
}

#pragma mark --
#pragma mark -- infotableViewDelegate 
-(void)infoTableCellSelectRowAtIndexPath:(NSString *)infoTitle withCategoryIndex:(int)categoryIndex nsIndexPath:(NSIndexPath *)indexPath
{
    if (1 == categoryIndex)//基本信息
    {
        if (0 == indexPath.row)
        {
            IDInfoViewController *m_idInfoViewCtr = [[IDInfoViewController alloc] init];
            m_idInfoViewCtr.title = @"基本信息";
            m_idInfoViewCtr.idTitleStr  = infoTitle;
            [self .navigationController pushViewController:m_idInfoViewCtr animated:YES];
        }else if (1 == indexPath.row)
        {
            PersonalViewController *m_personalInfoViewCtr = [[PersonalViewController alloc] init];
            m_personalInfoViewCtr.title = @"基本信息";
            [self .navigationController pushViewController:m_personalInfoViewCtr animated:YES];
        }

    }else if (2 == categoryIndex)//评估信息
    {
        
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
