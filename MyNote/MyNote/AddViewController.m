//
//  AddViewController.m
//  MyNote
//
//  Created by 高宇 on 16/6/27.
//  Copyright © 2016年 高宇. All rights reserved.
//

#import "AddViewController.h"
#import "NoteBL.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)Cancel:(id)sender;
- (IBAction)Save:(id)sender;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)Cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)Save:(id)sender {
    
    NSDate *date = [NSDate date];
    Note *note = [[Note alloc] init];
    note.date = date;
    note.context = self.textView.text;
    
    NoteBL *noteBL = [[NoteBL alloc] init];
    [noteBL createNote:note];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
