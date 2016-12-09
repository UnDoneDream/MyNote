//
//  ViewController.m
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "TableViewCell.h"
#import "NoteBL.h"
#import "Note.h"

@interface ViewController ()
- (IBAction)Edit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView reloadData];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NoteBL *)noteBL
{
    _noteBL = [[NoteBL alloc] init];
    return _noteBL;
}

- (NSMutableArray *)listData
{
    _listData = [self.noteBL findAll];
    return _listData;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Note *note = self.listData[indexPath.row];
    static NSString *ID = @"cellID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        //设置cell的箭头
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        //设置cell选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    cell.textLabel.text = note.context;
    cell.detailTextLabel.text = [formatter stringFromDate:note.date];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Note *note = self.listData[indexPath.row];
    DetailViewController *VC = [[DetailViewController alloc] init];
    VC.detail = note.context;
    [self.navigationController pushViewController:VC animated:YES];
}

//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return @"删除";
//}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.listData removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Edit:(id)sender {
    UIBarButtonItem *item = (UIBarButtonItem *)sender;
    if ([item.title isEqualToString:@"Edit"]) {
        item.title = @"Done";
        [_tableView setEditing:YES animated:YES];
    }else{
        item.title = @"Edit";
        [_tableView setEditing:NO animated:YES];
    }
    
}
@end
