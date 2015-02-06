//
//  ViewController.h
//  ToDoList
//
//  Created by 李哲維 on 2015/2/5.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic)IBOutlet UIButton *addButton;
@property (nonatomic)IBOutlet UITableView *tableView;
@property (strong)UITableViewCell *tableViewCell;

@end