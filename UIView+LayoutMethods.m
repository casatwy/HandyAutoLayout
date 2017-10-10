//
//  UIView+LayoutMethods.m
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import "UIView+LayoutMethods.h"
#import <objc/runtime.h>

static void *kUIViewLayoutMethodPropertyBottomGap = &kUIViewLayoutMethodPropertyBottomGap;
static void *kUIViewLayoutMethodPropertyTopGap = &kUIViewLayoutMethodPropertyTopGap;
static void *kUIViewLayoutMethodPropertyLeftGap = &kUIViewLayoutMethodPropertyLeftGap;
static void *kUIViewLayoutMethodPropertyRightGap = &kUIViewLayoutMethodPropertyRightGap;

@implementation UIView (LayoutMethods)

// coordinator getters
- (CGFloat)ct_height
{
    return self.frame.size.height;
}

- (CGFloat)ct_width
{
    return self.frame.size.width;
}

- (CGFloat)ct_x
{
    return self.frame.origin.x;
}

- (CGFloat)ct_y
{
    return self.frame.origin.y;
}

- (CGSize)ct_size
{
    return self.frame.size;
}

- (CGPoint)ct_origin
{
    return self.frame.origin;
}

- (CGFloat)ct_centerX
{
    return self.center.x;
}

- (CGFloat)ct_centerY
{
    return self.center.y;
}

- (CGFloat)ct_left
{
    return self.frame.origin.x;
}

- (CGFloat)ct_top
{
    return self.frame.origin.y;
}

- (CGFloat)ct_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)ct_right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setCt_x:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setCt_y:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setCt_left:(CGFloat)left
{
    self.ct_x = left;
}

- (void)setCt_top:(CGFloat)top
{
    self.ct_y = top;
}

- (void)setCt_height:(CGFloat)height
{
    CGRect newFrame = CGRectMake(self.ct_x, self.ct_y, self.ct_width, height);
    self.frame = newFrame;
}

- (void)heightEqualToView:(UIView *)view
{
    self.ct_height = view.ct_height;
}

// width
- (void)setCt_width:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.ct_x, self.ct_y, width, self.ct_height);
    self.frame = newFrame;
}

- (void)widthEqualToView:(UIView *)view
{
    self.ct_width = view.ct_width;
}

// center
- (void)setCt_centerX:(CGFloat)centerX
{
    CGPoint center = CGPointMake(self.ct_centerX, self.ct_centerY);
    center.x = centerX;
    self.center = center;
}

- (void)setCt_centerY:(CGFloat)centerY
{
    CGPoint center = CGPointMake(self.ct_centerX, self.ct_centerY);
    center.y = centerY;
    self.center = center;
}

- (void)centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ct_centerX = centerPoint.x;
}

- (void)centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ct_centerY = centerPoint.y;
}

- (void)centerEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ct_centerX = centerPoint.x;
    self.ct_centerY = centerPoint.y;
}

// top, bottom, left, right -- Version 1.1.0
- (void)fromTheTop:(CGFloat)distance ofView:(UIView *)view
{
    [self bottom:distance FromView:view];
}

- (void)fromTheBottom:(CGFloat)distance ofView:(UIView *)view
{
    [self top:distance FromView:view];
}

- (void)fromTheLeft:(CGFloat)distance ofView:(UIView *)view
{
    [self left:distance FromView:view];
}

- (void)fromTheRight:(CGFloat)distance ofView:(UIView *)view
{
    [self right:distance FromView:view];
}


- (void)fromTheRelativeTop:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self bottomRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeBottom:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self topRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeLeft:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self leftRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeRight:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self rightRatio:distance FromView:view screenType:screenType];
}


- (void)relativeTopInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self topRatioInContainer:top shouldResize:shouldResize screenType:screenType];
}

- (void)relativeBottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self bottomRatioInContainer:bottom shouldResize:shouldResize screenType:screenType];
}

- (void)relativeLeftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self leftRatioInContainer:left shouldResize:shouldResize screenType:screenType];
}

- (void)relativeRightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self rightRatioInContainer:right shouldResize:shouldResize screenType:screenType];
}


// top, bottom, left, right -- Old Version
- (void)top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_y = floorf(newOrigin.y + top + view.ct_height);
}

- (void)bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_y = newOrigin.y - bottom - self.ct_height;
}

- (void)left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_x = newOrigin.x - left - self.ct_width;
}

- (void)right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_x = newOrigin.x + right + view.ct_width;
}

- (void)topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.ct_width;
    [self top:topValue FromView:view];
}

- (void)bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.ct_width;
    [self bottom:bottomValue FromView:view];
}

- (void)leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.ct_width;
    [self left:leftValue FromView:view];
}

- (void)rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.ct_width;
    [self right:rightValue FromView:view];
}

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ct_height = self.ct_y - top + self.ct_height;
    }
    self.ct_y = top;
}

- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ct_height = self.superview.ct_height - bottom - self.ct_y - self.safeAreaBottomGap;
    } else {
        self.ct_y = self.superview.ct_height - self.ct_height - bottom - self.safeAreaBottomGap;
    }
}

- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ct_width = self.ct_x - left + self.ct_width;
    }
    self.ct_x = left;
}

- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ct_width = self.superview.ct_width - right - self.ct_x;
    } else {
        self.ct_x = self.superview.ct_width - self.ct_width - right;
    }
}

- (void)topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.ct_width;
    [self topInContainer:topValue shouldResize:shouldResize];
}

- (void)bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.ct_width;
    [self bottomInContainer:bottomValue shouldResize:shouldResize];
}

- (void)leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.ct_width;
    [self leftInContainer:leftValue shouldResize:shouldResize];
}

- (void)rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.ct_width;
    [self rightInContainer:rightValue shouldResize:shouldResize];
}

- (void)topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_y = newOrigin.y;
}

- (void)bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_y = newOrigin.y + view.ct_height - self.ct_height;
}

- (void)leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_x = newOrigin.x;
}

- (void)rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ct_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ct_x = newOrigin.x + view.ct_width - self.ct_width;
}

// size
- (void)setCt_size:(CGSize)size
{
    self.frame = CGRectMake(self.ct_x, self.ct_y, size.width, size.height);
}

- (void)setSize:(CGSize)size screenType:(UIScreenType)screenType
{
    CGFloat ratio = SCREEN_WIDTH / screenType;
    self.frame = CGRectMake(self.ct_x, self.ct_y, size.width * ratio, size.height * ratio);
}

- (void)sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.ct_x, self.ct_y, view.ct_width, view.ct_height);
}

// imbueset
- (void)fillWidth
{
    self.ct_width = self.superview.ct_width;
    self.ct_x = 0;
}

- (void)fillHeight
{
    self.ct_height = self.superview.ct_height;
    self.ct_y = 0;
}

- (void)fill
{
    self.frame = CGRectMake(0, 0, self.superview.ct_width, self.superview.ct_height);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

// iPhoneX adapt
- (CGFloat)safeAreaBottomGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
			if (self.superview.safeAreaLayoutGuide.layoutFrame.size.height > 0) {
                gap = @((self.superview.ct_height - self.superview.safeAreaLayoutGuide.layoutFrame.origin.y - self.superview.safeAreaLayoutGuide.layoutFrame.size.height));
            } else {
                gap = nil;
            }
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaTopGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.y);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaLeftGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaRightGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

@end
