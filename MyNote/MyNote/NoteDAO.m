//
//  NoteDAO.m
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO

static NoteDAO *shareManager = nil;

+ (NoteDAO *)shareManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date1 = [formatter dateFromString:@"2016-06-27 14:51:41"];
        Note *note1 = [[Note alloc] init];
        note1.date = date1;
        note1.context = @"WelCome to MyNote";
        
        NSDate *date2 = [NSDate date];
        Note *note2 = [[Note alloc] init];
        note2.date = date2;
        note2.context = @"欢迎使用MyNote";
        
        shareManager = [[self alloc] init];
        shareManager.listData = [NSMutableArray array];
        [shareManager.listData addObject:note1];
        [shareManager.listData addObject:note2];
        
    });
    return shareManager;
}
- (int) create:(Note *)model
{
    [self.listData addObject:model];
    return 0;
}
- (int) remove:(Note *)model
{
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            [self.listData removeObject:note];
            break;
        }
    }
    return 0;
}
- (int) modify:(Note *)model
{
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            note.context = model.context;
            break;
        }
    }
    return 0;
}
- (NSMutableArray *)findAll
{
    return self.listData;
}
- (Note *)findById:(Note *)model
{
    for (Note *note in self.listData) {
        if ([note.date isEqualToDate:model.date]) {
            return note;
        }
    }
    return nil;
}

@end
