//
//  SupplementaryModleViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/4.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "SupplementaryModleViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Retired-Define.h"
@interface SupplementaryModleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *supplementAry;
@property (nonatomic, strong) UITableView *supplementListTableView;
@end

@implementation SupplementaryModleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    // Do any additional setup after loading the view.
    _supplementListTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    _supplementListTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _supplementListTableView.delegate = self;
    _supplementListTableView.dataSource = self;
    [self.view addSubview:_supplementListTableView];
    _supplementAry = [NSArray arrayWithObjects:@"(一)个人补充信息",
                 @"(二)智力状态检查结果",nil];
   
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
    cell.textLabel.text = [_supplementAry objectAtIndex:indexPath.row];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _supplementAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
    }else
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
