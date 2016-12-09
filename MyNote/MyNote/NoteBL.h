//
//  NoteBL.h
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "NoteDAO.h"
@interface NoteBL : NSObject

- (NSMutableArray *)createNote:(Note *)model;

- (NSMutableArray *)remove:(Note *)model;

- (NSMutableArray *)findAll;

@end
