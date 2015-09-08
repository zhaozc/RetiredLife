

//
//  InfoTableView.m
//  RetiredLife
//
//  Created by Water on 15/9/6.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "InfoTableView.h"
#import "Retired-Define.h"
@implementation InfoTableView
@synthesize categoryIndex = _categoryIndex;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _infoAry  = [[NSMutableArray alloc] init];
        _infoListTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
        _infoListTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _infoListTableView.delegate = self;
        _infoListTableView.dataSource = self;
        [self addSubview:_infoListTableView];
    }
    return self;
}

-(void)setCategory
{
    NSArray *basicAry = [NSArray arrayWithObjects: @"(一)身份信息",
                         @"(二)个人信息",
                         @"(三)监护人/紧急联系人信息",
                         @"(四)目前生活状况",
                         @"(五)已确诊的疾病",
                         @"(六)家庭主要照护者信息",
                         @"(七)外部提供的专业看护服务（最近7天）",
                         @"(八)信息采集初步结果",
                         @"(九)居家照护管理员信息",@"(十)服务需求",@"(十一)补充信息",nil];
    
    NSArray *evaluatAry = [NSArray arrayWithObjects:@"(一)评估身份信息",
                           @"(二)日常生活能力",
                           @"(三)精神状态",
                           @"(四)感知觉与沟通",
                           @"(五)社会参与",
                           @"(六)补充评估信息",
                           @"(七)能力评估结论",
                           @"(八)主责评估员信息",
                           @"(九)评估补充说明",nil];
    
    NSArray *supplementAry = [NSArray  arrayWithObjects:@"(一)个人补充信息",
                              @"(二)智力状态检查结果",nil];
    if ( 1 == _categoryIndex) {
        [_infoAry addObjectsFromArray:basicAry];
    }else if( 2== _categoryIndex)
    {
         [_infoAry addObjectsFromArray:evaluatAry];
    }else if( 3== _categoryIndex)
    {
        [_infoAry addObjectsFromArray:supplementAry];
    }

    [self.infoListTableView reloadData];
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
    cell.textLabel.text = [_infoAry objectAtIndex:indexPath.row];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _infoAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellTitleStr = [_infoAry objectAtIndex:indexPath.row];
    [self.delegate infoTableCellSelectRowAtIndexPath:cellTitleStr withCategoryIndex:_categoryIndex nsIndexPath:indexPath ];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
