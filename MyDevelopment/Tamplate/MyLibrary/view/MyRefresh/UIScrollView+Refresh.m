//
//  UIScrollView+Refresh.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/28/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <objc/runtime.h>

#import "UIScrollView+Refresh.h"
#import "MyRefreshHeaderView.h"
#import "MyRefreshFooterView.h"

@interface UIScrollView ()

@property(nonatomic, weak) MyRefreshHeaderView* headerView;
@property(nonatomic, weak) MyRefreshFooterView* footerView;

@end

@implementation UIScrollView (Refresh)

#pragma mark - 运行时相关
static char MyRefreshHeaderViewKey;
static char MyRefreshFooterViewKey;

-(void)setHeaderView:(MyRefreshHeaderView *)headerView
{
    [self willChangeValueForKey:@"MyRefreshHeaderViewKey"];
    objc_setAssociatedObject(self, &MyRefreshHeaderViewKey, headerView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"MyRefreshHeaderViewKey"];
}
-(MyRefreshHeaderView*)headerView{
    return objc_getAssociatedObject(self, &MyRefreshHeaderViewKey);
}

-(void)setFooterView:(MyRefreshFooterView *)footerView
{
    [self willChangeValueForKey:@"MyRefreshFooterViewKey"];
    objc_setAssociatedObject(self, &MyRefreshFooterViewKey, footerView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"MyRefreshHeaderViewKey"];
}
-(MyRefreshFooterView*)footerView
{
    return objc_getAssociatedObject(self, &MyRefreshFooterViewKey);
}

#pragma mark - Header Refresh
-(void)addHeaderWithCallback:(void (^)())callback
{
    if (self.headerView == nil) {
        MyRefreshHeaderView* headerView = [MyRefreshHeaderView headerView];
        [self addSubview:headerView];
        self.headerView = headerView;
    }
    self.headerView.beginRefreshingCallback = callback;
}

-(void)addHeaderWithTarget:(id)target action:(SEL)action
{
    if (self.headerView == nil) {
        MyRefreshHeaderView* headerView = [MyRefreshHeaderView headerView];
        [self addSubview:headerView];
        self.headerView = headerView;
    }
    self.headerView.beginRefreshingTarget = target;
    self.headerView.beginRefreshingAction = action;
}
-(void)removeHeader
{
    [self.headerView removeFromSuperview];
    self.headerView = nil;
}
-(void)headerBeginRefreshing
{
    [self.headerView beginRefreshing];
}
@end
