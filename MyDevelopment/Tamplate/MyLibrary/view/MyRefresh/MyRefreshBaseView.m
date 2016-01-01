//
//  MyRefreshBaseView.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/28/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <objc/message.h>

#import "MyRefreshBaseView.h"
#import "MyRefresh.h"

NSString *const MyRefreshContentOffset = @"contentOffset";

@interface MyRefreshBaseView ()
{
    UIEdgeInsets _scrollViewOriginalInset;
}

@property(nonatomic, readonly) UIScrollView*    scrollView;

@end

@implementation MyRefreshBaseView
@synthesize scrollView = _scrollView;

-(id)initWithFrame:(CGRect)frame
{
    frame.size.height = MyRefreshViewHeight;
    if (self = [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor redColor];
        
        self.state = MyRefreshStateNormal;
    }
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    [self.superview removeObserver:self forKeyPath:MyRefreshContentOffset context:nil];
    if (newSuperview) {
        [newSuperview addObserver:self forKeyPath:MyRefreshContentOffset options:NSKeyValueObservingOptionNew context:nil];
        
        
        self.frame = CGRectMake(0, 0, newSuperview.bounds.size.width, MyRefreshViewHeight);
        
        _scrollView = (UIScrollView*)newSuperview;
        _scrollViewOriginalInset = _scrollView.contentInset;
    }
}

-(void)drawRect:(CGRect)rect
{
//    if (self.state == MyRefreshStateWillRefreshing) {
//        self.state = MyRefreshStateRefreshing;
//    }
}
-(BOOL)isRefreshing
{
    return MyRefreshStateRefreshing == self.state;
}

-(void)beginRefreshing
{
    if (self.state == MyRefreshStateRefreshing) {
        if ([self.beginRefreshingTarget respondsToSelector:self.beginRefreshingAction]) {
             msgSend((__bridge void *)(self.beginRefreshingTarget), self.beginRefreshingAction, self);
        }
        if (self.beginRefreshingCallback) {
            self.beginRefreshingCallback();
        }
    } else {
        if (self.window) {
            self.state = MyRefreshStateRefreshing;
        } else {
            _state = MyRefreshStateRefreshing;
            [super setNeedsDisplay];
        }
    }
}

-(void)endRefreshing
{
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.state = MyRefreshStateNormal;
    });
}
-(void)setState:(MyRefreshState)state
{
    if (self.state != MyRefreshStateRefreshing) {
        _scrollViewOriginalInset = self.scrollView.contentInset;
    }
    
    if (self.state == state) {
        return;
    }
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.userInteractionEnabled || self.alpha <= 0.01 || self.hidden) {
        return;
    }
    if (self.state == MyRefreshStateRefreshing) {
        return;
    }
    if ([MyRefreshContentOffset isEqualToString:keyPath]) {
        [self adjustStateWithContentOffset];
    }
}
- (void)adjustStateWithContentOffset
{
    CGFloat currentOffetsetY = self.scrollView.contentOffset.y;
    CGFloat happenOffsetY = - _scrollViewOriginalInset.top;
    
    if (currentOffetsetY >= happenOffsetY) {
        return;
    }
    
    if (self.scrollView.isDragging) {
        CGFloat normal2pullingOffsetY = happenOffsetY - self.scrollView.frame.size.height;
        if (self.state == MyRefreshStateNormal && currentOffetsetY < normal2pullingOffsetY) {
            self.state = MyRefreshStatePulling;
        } else if (self.state == MyRefreshStatePulling && currentOffetsetY >= normal2pullingOffsetY) {
            self.state = MyRefreshStateNormal;
        }
    } else if (self.state == MyRefreshStatePulling) {
        self.state = MyRefreshStateRefreshing;
    }
}
@end
