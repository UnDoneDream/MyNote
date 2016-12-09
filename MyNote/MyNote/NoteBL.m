//
//  NoteBL.m
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "NoteBL.h"

@implementation NoteBL

- (NSMutableArray *)createNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    [dao create:model];
    return [dao findAll];
}

- (NSMutableArray *)remove:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    [dao remove:model];
    return [dao findAll];
}

- (NSMutableArray *)findAll
{
    NoteDAO *dao = [NoteDAO shareManager];
    return [dao findAll];
}

@end
