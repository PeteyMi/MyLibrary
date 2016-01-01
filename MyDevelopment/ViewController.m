//
//  ViewController.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/24/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+Refresh.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView addHeaderWithTarget:self action:@selector(start)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView headerBeginRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)start
{
    
}
@end
