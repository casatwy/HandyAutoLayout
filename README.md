HandyAutoLayout
===============

handy categories for generate NSLayoutConstraint programatically.

Usage
===============

    [self.view addConstraint:[self.tableView constraintCenterXEqualToView:self.view]];
    [self.view addConstraint:[self.tableView constraintWidthEqualToView:self.view]];
    
    [self.view addConstraints:[self.nextStepButton constraintsSize:CGSizeMake(300.0f, 40.0f)]];
    [self.view addConstraint:[self.nextStepButton constraintCenterXEqualToView:self.view]];
