//
//  UIViewController+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "UIViewController+My.h"
#import "NSObject+My.h"
#import "UIView+My.h"

#pragma mark - Nib
@implementation UIViewController (Nib)

+(instancetype)loadDefaultInstanceFromNib
{
    return [self loadInstanceWithNibName:[self className]];
}
+(instancetype)loadInstanceWithNibName:(NSString*)nibName
{
    NSArray* array = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (id item in array) {
        if ([[item className] isEqualToString:[self className]]) {
            return item;
        }
    }
    return nil;
}

@end

#pragma mark- Keyboard
@implementation UIViewController (Keyboard)

-(void)addKeyboardNotificationWithTapGesture:(BOOL)value
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    if (value == YES) {
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHideTapGestureAction:)];
        [self.view addGestureRecognizer:tapGesture];
    }
}
-(void)removeKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}
-(void)keyboardWillShowNotification:(NSNotification*)notification
{
    
}
-(void)keyboardWillHideNotification:(NSNotification*)notification
{
    
}

-(void)keyboardHideTapGestureAction:(nullable UITapGestureRecognizer*)tapGesture
{
    [self.view hideKeyboard];
    [self.view removeGestureRecognizer:tapGesture];
}

@end

#pragma mark - NavigationBar
@implementation UIViewController (NavigationBar)

-(void)setupNavigationBarLeftItemImage:(nullable UIImage* )image
{
    if (image == nil) {
        return;
    }
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self   action:@selector(navigationBarLeftButtionPress:)];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)setupNavigationBarRightItemImage:(nullable UIImage* )image
{
    if (image == nil) {
        return;
    }
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self   action:@selector(navigationBarRightButtionPress:)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)setupNavigationBarLeftItemTitle:(nullable NSString *)title
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(navigationBarLeftButtionPress:)];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)setupNavigationBarRightItemTitle:(nullable NSString *)title
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(navigationBarRightButtionPress:)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)navigationBarLeftButtionPress:(id)sender
{
    NSAssert(0, @"SubClass must overwirte it");
}
-(void)navigationBarRightButtionPress:(id)sender
{
    NSAssert(0, @"SubClass must overwirte it");
}

@end