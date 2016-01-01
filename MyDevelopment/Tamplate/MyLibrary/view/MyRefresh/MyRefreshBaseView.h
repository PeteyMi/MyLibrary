//
//  MyRefreshBaseView.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/28/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MyView.h"

#pragma mark - control's refresh state
typedef enum {
    MyRefreshStatePulling = 1, // 松开就可以进行刷新的状态
    MyRefreshStateNormal = 2, // 普通状态
    MyRefreshStateRefreshing = 3, // 正在刷新中的状态
    MyRefreshStateWillRefreshing = 4
} MyRefreshState;

#pragma mark - control type
typedef enum {
    MyRefreshViewTypeHeader = -1, // 头部控件
    MyRefreshViewTypeFooter = 1 // 尾部控件
} MyRefreshViewType;

@interface MyRefreshBaseView : MyView

@property(nonatomic, readonly) UILabel* statusLabel;
@property(nonatomic, readonly) UIImageView* imageView;
@property(nonatomic, readonly) UIActivityIndicatorView* UIActivityIndicatorView;

@property(nonatomic, weak) id beginRefreshingTarget;
@property(nonatomic, assign) SEL    beginRefreshingAction;
/*
 *  Call it when refresh change to refreshing status.
 */
@property(nonatomic, copy) void (^beginRefreshingCallback)();

@property(nonatomic, readonly, getter=isRefreshing) BOOL refreshing;


@property (assign, nonatomic) MyRefreshState state;

/*
 *  Begi refresh
 */
-(void)beginRefreshing;
/*
 *  End refresh
 */
-(void)endRefreshing;
@end
