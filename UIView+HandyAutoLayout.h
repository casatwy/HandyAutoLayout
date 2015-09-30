//
//  UIView+HandyAutoLayout.h
//  ZhanYe
//
//  Created by casa on 14-8-25.
//  Copyright (c) 2014年 me.andpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HandyAutoLayout <NSObject>

- (void)addConstraints;

@end

@interface UIView (HandyAutoLayout)

// height
- (NSLayoutConstraint *)constraintHeight:(CGFloat)height;
- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view;

// width
- (NSLayoutConstraint *)constraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view;

// center
- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view;

// top, bottom, left, right
- (NSArray *)constraintsTop:(CGFloat)top FromView:(UIView *)view;
- (NSArray *)constraintsBottom:(CGFloat)bottom FromView:(UIView *)view;
- (NSArray *)constraintsLeft:(CGFloat)left FromView:(UIView *)view;
- (NSArray *)constraintsRight:(CGFloat)right FromView:(UIView *)view;

- (NSArray *)constraintsTopInContainer:(CGFloat)top;
- (NSArray *)constraintsBottomInContainer:(CGFloat)bottom;
- (NSArray *)constraintsLeftInContainer:(CGFloat)left;
- (NSArray *)constraintsRightInContainer:(CGFloat)right;

- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view;

// size
- (NSArray *)constraintsSize:(CGSize)size;
- (NSArray *)constraintsSizeEqualToView:(UIView *)view;

// imbue
- (NSArray *)constraintsFillWidth;
- (NSArray *)constraintsFillHeight;
- (NSArray *)constraintsFill;

// assign
- (NSArray *)constraintsAssignLeft;
- (NSArray *)constraintsAssignRight;
- (NSArray *)constraintsAssignTop;
- (NSArray *)constraintsAssignBottom;

@end
