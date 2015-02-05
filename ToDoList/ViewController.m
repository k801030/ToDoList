//
//  ViewController.m
//  ToDoList
//
//  Created by 李哲維 on 2015/2/5.
//  Copyright (c) 2015年 NTU. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong)NSArray *itemArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.addButton
        addTarget:self
        action:@selector(click:)
        forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton

- (void)click:(id)sender {
    NSLog(@"button have been clicked.");
}

@end
