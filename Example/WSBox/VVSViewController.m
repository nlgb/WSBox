//
//  VVSViewController.m
//  VVSBox
//
//  Created by songwangs on 08/09/2017.
//  Copyright (c) 2017 songwangs. All rights reserved.
//

#import "VVSViewController.h"
#import "WSSwizzle.h"
#import "WSBatteryInfoManager.h"
#import "UIImage+WSExtension.h"

@interface VVSViewController ()

@end

@implementation VVSViewController

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
