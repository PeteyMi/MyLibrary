//
//  MyViewController.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/24/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+My.h"

@interface MyViewController : UIViewController

#pragma mark Progress
-(void)showProgressWithText:(NSString*)text;
-(void)showProgressWithText:(NSString *)text delay:(NSTimeInterval)delay;
- (void)hideProgress:(BOOL)animated;


@end
