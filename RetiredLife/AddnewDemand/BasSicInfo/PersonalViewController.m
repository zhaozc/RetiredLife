//
//  PersonalViewController.m
//  RetiredLife
//
//  Created by Water on 15/9/7.
//  Copyright (c) 2015年 Water. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalView.h"
#import "Retired-Define.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PersonalView  *m_personanlView = [[PersonalView alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT+20, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    [self.view addSubview:m_personanlView];
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
