//
//  ToDoListTableVC.m
//  ToDoList
//
//  Created by 李哲維 on 2015/2/6.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

#import "ToDoListTableVC.h"

@interface ToDoListTableVC ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] initWithName:@"clearHouse"];
    ToDoItem *item2 = [[ToDoItem alloc] initWithName:@"WatchMovie"];
    [self.toDoItems addObject:item1];
    [self.toDoItems addObject:item2];
}

#pragma mark - table cells

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView: tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.toDoItems objectAtIndex:indexPath.row] itemName];
    return cell;
}

#pragma mark - segue

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
}


@end
