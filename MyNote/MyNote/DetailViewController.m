//
//  DetailViewController.m
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"详细";
    [self createUI];
}

- (void)createUI
{
    UILabel *label = [[UILabel alloc] init];
    label.center = self.view.center;
    label.bounds = CGRectMake(0, 0, self.view.bounds.size.width - 20, 100);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = self.detail;
    [self.view addSubview:label];
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
