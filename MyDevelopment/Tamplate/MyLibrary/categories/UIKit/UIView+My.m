//
//  UIView+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "UIView+My.h"

#pragma mark - Nib
@implementation UIView (Nib)

+(UINib*)defaultNibInstance
{
    return [self nibInstanceWithNibName:[self className]];
}
+(UINib*)nibInstanceWithNibName:(NSString*)nibName
{
    return [UINib nibWithNibName:nibName bundle:nil];
}

+(NSString*)reuseIdentifier
{
    return [self className];
}

+(instancetype)loadDefaultInstanceFromNib
{
    return [self loadInstanceWithNibName:[self className]];
}
+(instancetype)loadInstanceWithNibName:(NSString*)nibName
{
    NSArray* array = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (id item in array) {
        if ([NSStringFromClass([item class]) isEqualToString:NSStringFromClass([self class])]) {
            return item;
        }
    }
    return nil;
}

@end

#pragma mark- Keyboard
@implementation UIView (Keyboard)

-(UIView*)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView* item in self.subviews) {
        UIView* view = [item findFirstResponder];
        if (view) {
            return view;
        }
    }
    return nil;
}
-(void)hideKeyboard
{
    UIView* view = [self findFirstResponder];
    if (view) {
        [view resignFirstResponder];
    }
}
@end

#pragma mark- Frame
@implementation UIView (Frame)

+(CGFloat)viewHeight
{
    return 0.0;
}

-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}
-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}
-(CGFloat)minX
{
    return CGRectGetMinX(self.frame);
}
-(CGFloat)minY
{
    return CGRectGetMinY(self.frame);
}

@end