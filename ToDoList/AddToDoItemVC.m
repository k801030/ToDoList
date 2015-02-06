//
//  AddToDoViewController.m
//  ToDoList
//
//  Created by 李哲維 on 2015/2/6.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

#import "AddToDoItemVC.h"
#import "ToDoItem.h"
@interface AddToDoItemVC()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property ToDoItem *todoItem;

@end

@implementation AddToDoItemVC

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveButton) {
        return;
    }
    if (self.textField.text.length > 0) {
        self.todoItem = [[ToDoItem alloc] initWithName:self.textField.text];
    }
}

@end
