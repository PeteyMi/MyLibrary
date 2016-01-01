//
//  UIViewController+My.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Nib
@interface UIViewController (Nib)
+(nullable instancetype)loadDefaultInstanceFromNib;
+(nullable instancetype)loadInstanceWithNibName:(nullable NSString*)nibName;
@end

#pragma mark - Keyboard
@interface UIViewController (Keyboard)

-(void)addKeyboardNotificationWithTapGesture:(BOOL)value;
-(void)removeKeyboardNotification;
-(void)keyboardWillShowNotification:(nullable NSNotification* )notification;
-(void)keyboardWillHideNotification:(nullable NSNotification*)notification;
-(void)keyboardHideTapGestureAction:(nullable UITapGestureRecognizer*)tapGesture;
@end

#pragma mark - NavigationBar
@interface UIViewController (NavigationBar)

-(void)setupNavigationBarLeftItemImage:(nullable UIImage* )image;
-(void)setupNavigationBarRightItemImage:(nullable UIImage* )image;
-(void)setupNavigationBarLeftItemTitle:(nullable NSString *)title;
-(void)setupNavigationBarRightItemTitle:(nullable NSString *)title;

-(void)navigationBarLeftButtionPress:(nullable id)sender;
-(void)navigationBarRightButtionPress:(nullable id)sender;

@end

