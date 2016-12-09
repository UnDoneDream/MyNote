//
//  NoteDAO.h
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject


@property (strong, nonatomic) NSMutableArray *listData;

+ (NoteDAO *)shareManager;
- (int) create:(Note *)model;
- (int) remove:(Note *)model;
- (int) modify:(Note *)model;
- (NSMutableArray *)findAll;
- (Note *)findById:(Note *)model;

@end
