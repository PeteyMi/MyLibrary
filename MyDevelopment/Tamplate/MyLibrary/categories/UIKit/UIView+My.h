//
//  UIView+My.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+My.h"

#pragma mark- Nib
@interface UIView (Nib)

+(UINib*)defaultNibInstance;
+(UINib*)nibInstanceWithNibName:(NSString*)nibName;
+(NSString*)reuseIdentifier;

+(instancetype)loadDefaultInstanceFromNib;
+(instancetype)loadInstanceWithNibName:(NSString*)nibName;

@end

#pragma mark- Keyboard
@interface UIView (Keyboard)

-(UIView*)findFirstResponder;
-(void)hideKeyboard;

@end

#pragma mark- Frame
@interface UIView (Frame)

+(CGFloat)viewHeight;
-(CGFloat)height;

-(CGFloat)maxX;
-(CGFloat)maxY;
-(CGFloat)minX;
-(CGFloat)minY;
@end