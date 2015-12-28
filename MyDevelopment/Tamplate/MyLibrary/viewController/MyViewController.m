//
//  MyViewController.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/24/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MyViewController.h"
#import "MBProgressHUD.h"

@interface MyViewController ()

@property(nonatomic, strong) MBProgressHUD* progressHUD;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Progress
-(void)showProgressWithText:(NSString*)text
{
    self.progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.progressHUD.labelText = text;
}
-(void)showProgressWithText:(NSString *)text delay:(NSTimeInterval)delay
{
    self.progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.progressHUD.labelText = text;
    [self.progressHUD hide:YES afterDelay:delay];
}
- (void)hideProgress:(BOOL)animated
{
    [self.progressHUD hide:YES];
    self.progressHUD = nil;
}

@end
