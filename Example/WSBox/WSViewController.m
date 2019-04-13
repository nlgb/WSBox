//
//  WSViewController.m
//  WSBox
//
//  Created by nlgb on 04/06/2019.
//  Copyright (c) 2019 nlgb. All rights reserved.
//

#import "WSViewController.h"
#import "WSSwizzle.h"
#import "WSBatteryInfoManager.h"

@interface WSViewController ()

@end

@implementation WSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)ws_viewWillAppear:(BOOL)animated {
    [self ws_viewWillAppear:animated];
    NSLog(@"ws_viewWillAppear");
}

+ (void)load {
    ws_swizzleInstanceMethod(self, NSSelectorFromString(@"viewWillAppear:"), NSSelectorFromString(@"ws_viewWillAppear:"));
}
@end
