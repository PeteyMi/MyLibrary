//
//  MySegmentView.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MyView.h"

IB_DESIGNABLE
@interface MySegmentItem : UIView

@property(nonatomic, readonly) UILabel* textLabel;

+(id)itemWithText:(NSString*)text;
-(id)initWithText:(NSString*)text;

@end

IB_DESIGNABLE
@interface MySegmentView : MyView

@property(nonatomic, weak) id delegate;
@property(nonatomic, strong) IBInspectable UIFont* textFont;
@property(nonatomic, strong) IBInspectable UIColor* textColor;
@property(nonatomic, strong) IBInspectable UIColor* lineColor;
@property(nonatomic, assign) IBInspectable CGFloat lineHeight;
@property(nonatomic, assign) IBInspectable NSInteger selectedIndex;

@property(nonatomic, strong) NSArray* itemsText;

-(instancetype)initWithItems:(NSArray*)array;

@end

@protocol MySegmentViewDelegate <NSObject>

-(void)segmentView:(MySegmentView*)view didSelectedIndex:(NSInteger)index;

@end