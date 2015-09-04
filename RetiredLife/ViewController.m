//
//  ViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/4.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "ViewController.h"
#import "Retired-Define.h"
#import "AddEvaluationViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *listTabelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _listTabelView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    _listTabelView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _listTabelView.delegate = self;
    _listTabelView.dataSource = self;
    [self.view addSubview:_listTabelView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - UITableViewDelegate & UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indenti0=@"mnutablecell0";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indenti0];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:indenti0];
        cell.textLabel.textColor = [UIColor grayColor];
    }
    if (0 == indexPath.row) {
          cell.textLabel.text = @"新建评估";
    }else
    {
         cell.textLabel.text = @"本地查询";
    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        AddEvaluationViewController *m_addEViewCtroller = [[AddEvaluationViewController alloc] init];
        m_addEViewCtroller.title = @"新建需求评估报告";
        [self.navigationController pushViewController:m_addEViewCtroller animated:YES];
        
    }else
    {
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
