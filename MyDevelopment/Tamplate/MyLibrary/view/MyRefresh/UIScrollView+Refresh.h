//
//  UIScrollView+Refresh.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/28/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

#pragma mark - Header Refresh

/*
 *  Add refresh header control
 *  @param callback when refresh has started.
 */
-(void)addHeaderWithCallback:(void (^)())callback;
-(void)addHeaderWithTarget:(id)target action:(SEL)action;

/*
 *  Remove header control
 */
-(void)removeHeader;

/*
 *  Make header refresh control change to refreshing status.
 */
-(void)headerBeginRefreshing;

/*
 *  Make header refresh control stop refreshing.
 */
-(void)headerEndFrefreshing;

/*
 * Header refresh view visibility
 */
@property (nonatomic, assign, getter=isHeaderHidden) BOOL headerHidden;

/*
 *  Whether header refresh control is refreshing.
 */
@property (nonatomic, assign, readonly, getter=isHeaderRefreshing) BOOL headerRefreshing;

@property (copy, nonatomic) NSString *headerPullToRefreshText;
@property (copy, nonatomic) NSString *headerReleaseToRefreshText;
@property (copy, nonatomic) NSString *headerRefreshingText;

#pragma mark - Footer Refresh
-(void)addFooterWithCallback:(void (^)())callback;
-(void)addFooterWithTarget:(id)target action:(SEL)action;

-(void)removeFooter;
-(void)footerBeginRefreshing;
-(void)footerEndRefreshing;
@property (nonatomic, assign, getter = isFooterHidden) BOOL footerHidden;


@property (nonatomic, assign, readonly, getter = isFooterRefreshing) BOOL footerRefreshing;

@property (copy, nonatomic) NSString *footerPullToRefreshText;
@property (copy, nonatomic) NSString *footerReleaseToRefreshText;
@property (copy, nonatomic) NSString *footerRefreshingText; 


@end
