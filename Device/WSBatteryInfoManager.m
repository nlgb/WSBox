//
//  WSBatteryInfoManager.m
//  Pods-WSBox_Example
//
//  Created by sw on 2019/4/13.
//

#import "WSBatteryInfoManager.h"
#import <UIKit/UIKit.h>

@implementation WSBatteryInfoManager
static WSBatteryInfoManager *_shareManager = nil;
+ (instancetype)instance {
    return [self shareManager];
}

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[WSBatteryInfoManager alloc] init];
    });
    return _shareManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [super allocWithZone:zone];
    });
    return _shareManager;
}

- (void)startMonitoring {
    UIDevice *device = [UIDevice currentDevice];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(p_batteryLevelDidChange:)
                                                 name:UIDeviceBatteryLevelDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(p_batteryStatusDidChange:)
                                                 name:UIDeviceBatteryStateDidChangeNotification
                                               object:nil];
    
    [device setBatteryMonitoringEnabled:YES];
    
    if ([device batteryState] != UIDeviceBatteryStateUnknown) {
        [self p_updateBatteryInfo];
    }
}

- (void)stopMonitoring {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)p_batteryLevelDidChange:(NSNotification *)noti {
    [self p_updateBatteryInfo];
}

- (void)p_batteryStatusDidChange:(NSNotification *)noti {
    [self p_updateBatteryInfo];
}

- (void)p_updateBatteryInfo {
    float batteryLevel = [[UIDevice currentDevice] batteryLevel];
    NSUInteger batteryPersent = batteryLevel * 100;
    self.batteryPersent = batteryPersent;
    UIDeviceBatteryState batteryState = [[UIDevice currentDevice] batteryState];
    
    switch (batteryState) {
        case UIDeviceBatteryStateUnplugged:     // 电源未接入
            if (batteryPersent == 100) {
                self.batteryState = WSBatteryStateFullUnCharging;
            } else if (batteryPersent >= 80) {
                self.batteryState = WSBatteryStateHighLevel;
            } else if (batteryPersent >= 50) {
                self.batteryState = WSBatteryStateMiddleLevel;
            } else if (batteryPersent >= 20) {
                self.batteryState = WSBatteryStateLessLevel;
            } else {
                self.batteryState = WSBatteryStateLowLevel;
            }
            break;
        case UIDeviceBatteryStateCharging:      // 电源接入 && < 100%
            self.batteryState = WSBatteryStateCharging;
            break;
        case UIDeviceBatteryStateFull:          // 电源未接入 && == 100%
            self.batteryState = WSBatteryStateFullCharging;
            break;
        case UIDeviceBatteryStateUnknown:
            self.batteryState = WSBatteryStateUnkown;
            break;
            
    }
}

@end
