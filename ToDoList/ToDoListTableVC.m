//
//  ToDoListTableVC.m
//  ToDoList
//
//  Created by 李哲維 on 2015/2/6.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

#import "ToDoListTableVC.h"
#import "AddToDoItemVC.h"

@interface ToDoListTableVC ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableVC

- (void)viewDidLoad {
    
    
    // load gesture event
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:recognizer];
    

    // loag initial data
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    [super viewDidLoad];
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
    ToDoItem *todoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = todoItem.itemName;
    if (todoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // deselect
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - gesture event

- (void)swipeGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipe gesture called");
}

#pragma mark - segue

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddToDoItemVC *source = [segue sourceViewController];
    ToDoItem *item = source.item;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}


@end
