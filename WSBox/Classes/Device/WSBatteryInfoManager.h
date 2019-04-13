//
//  WSBatteryInfoManager.h
//  Pods-WSBox_Example
//
//  Created by sw on 2019/4/13.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WSBatteryState) {
    WSBatteryStateUnkown,           // 未知
    WSBatteryStateFullCharging,     // 电量100%（电源接入）
    WSBatteryStateFullUnCharging,   // 电量100%（电源未接入）
    WSBatteryStateCharging,         // 正在充电（电源接入 && 电量低于100%）
    WSBatteryStateHighLevel,        // 高电量（电源未接入 && 电量80%~99%）
    WSBatteryStateMiddleLevel,      // 中电量（电源未接入 && 电量50%~79%）
    WSBatteryStateLessLevel,        // 较低电量（电源未接入 && 电量20%~49%）
    WSBatteryStateLowLevel,         // 低电量（电源未接入 && 电量低于20%）
    
//    WSBatteryStateUnCharge,         // 未充电（电源未接入 && 电量低于100%）

};

@interface WSBatteryInfoManager : NSObject
+ (instancetype)instance;
+ (instancetype)shareManager;

- (void)startMonitoring;
- (void)stopMonitoring;
// 电池状态
@property (nonatomic) WSBatteryState batteryState;
// 剩余电量
@property (nonatomic) NSUInteger batteryPersent;


@end
