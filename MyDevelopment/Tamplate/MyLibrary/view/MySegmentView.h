//
//  MySegmentView.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MyView.h"

@interface MySegmentView : MyView

@property(nonatomic, weak) id delegate;
@property(nonatomic, strong) UIFont* textFont;
@property(nonatomic, strong) UIColor* textColor;
@property(nonatomic, strong) UIColor* lineColor;
@property(nonatomic, assign) CGFloat lineHeight;
@property(nonatomic, assign) NSInteger selectedIndex;

@property(nonatomic, strong) NSArray* itemsText;

-(instancetype)initWithItems:(NSArray*)array;

@end

@protocol MySegmentViewDelegate <NSObject>

-(void)segmentView:(MySegmentView*)view didSelectedIndex:(NSInteger)index;

@end