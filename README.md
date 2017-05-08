# HandyAutoLayout

[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-0.1.1-green.svg?style=flat)](https://cocoapods.org) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http:// opensource.org/licenses/MIT)

`HandyAutoLayout` are handy categories for generate NSLayoutConstraint programatically.

# New features

## Add new methods for 1.1.0
```objective-c
- (void)fromTheTop:(CGFloat)distance ofView:(UIView *)view;
- (void)fromTheBottom:(CGFloat)distance ofView:(UIView *)view;
- (void)fromTheLeft:(CGFloat)distance ofView:(UIView *)view;
- (void)fromTheRight:(CGFloat)distance ofView:(UIView *)view;
```
# Install

if you are using AutoLayout:

```
pod 'HandyAutoLayout'
```

if you are using Frame:

```
pod 'HandyFrame'
```


# Examples

for auto layout:

```objective-c
[self.view addConstraint:[self.tableView constraintCenterXEqualToView:self.view]];
[self.view addConstraint:[self.tableView constraintWidthEqualToView:self.view]];

[self.view addConstraints:[self.nextStepButton constraintsSize:CGSizeMake(300.0f, 40.0f)]];
[self.view addConstraint:[self.nextStepButton constraintCenterXEqualToView:self.view]];
```
for frame:

```objective-c
[self.subtitleLabel leftEqualToView:self.titleLabel];
[self.subtitleLabel top:14 FromView:self.timeLabel];

[self.createPost centerXEqualToView:self.view];
[self.createPost bottomInContainer:19.0f shouldResize:NO];
```
