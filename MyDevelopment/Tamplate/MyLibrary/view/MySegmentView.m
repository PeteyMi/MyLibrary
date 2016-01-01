//
//  MySegmentView.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MySegmentView.h"


@interface MySegmentView ()

@property(nonatomic, readonly) NSMutableArray* items;

@end

@implementation MySegmentView
@synthesize itemsText = _itemsText;
@synthesize items = _items;

-(instancetype)initWithItems:(NSArray*)array
{
    if (self = [super initWithFrame:CGRectZero]) {
        self.itemsText = array;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(id)init
{
    if ([super init]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

-(NSMutableArray*)items
{
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

-(void)setItemsText:(NSArray *)itemsText
{
    _itemsText = itemsText;
    
    for (MySegmentItem* item in self.items) {
        [item removeFromSuperview];
    }
    [self.items removeAllObjects];
    
    for (NSInteger index = 0; index < _itemsText.count; index++) {
        NSString* text = [_itemsText objectAtIndex:index];
        MySegmentItem* item = [MySegmentItem itemWithText:text];
        item.tag = index;
        [self addSubview:item];
        [self.items addObject:item];
    }
    
    self.selectedIndex = 0;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / _itemsText.count;
    CGFloat height = self.bounds.size.height;
    for (NSInteger index = 0; index < self.items.count; index++) {
        MySegmentItem* item = [self.items objectAtIndex:index];
        item.frame = CGRectMake(width * index, 0, width, height);
    }
}

@end

@implementation MySegmentItem
@synthesize textLabel = _textLabel;

+(id)itemWithText:(NSString*)text
{
    return [[self alloc] initWithText:text];
}
                               
-(id)initWithText:(NSString *)text
{
    if (self = [super initWithFrame:CGRectZero]) {
        self.textLabel.text = text;
    }
    return self;
}

-(UILabel*)textLabel
{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.font = [UIFont systemFontOfSize:15.0];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (_textLabel) {
        _textLabel.frame = self.bounds;
    }
    
}

@end