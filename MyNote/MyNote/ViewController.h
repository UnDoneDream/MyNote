//
//  ViewController.h
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteBL;
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@property (strong, nonatomic) NoteBL *noteBL;

@property (strong, nonatomic) NSMutableArray *listData;

@end

