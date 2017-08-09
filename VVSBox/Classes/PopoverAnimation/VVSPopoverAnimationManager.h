//
//  VVSPopoverAnimationManager.h
//  VVSPopover
//
//  Created by sw on 16/10/22.
//  Copyright © 2016年 sw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NSString * const VVS_POPOVER_ANIMATION_DID_PRESENTED_NOTIFICATION = @"vvspopoveranimationdidpresentednotification";
NSString * const VVS_POPOVER_ANIMATION_DID_DISMISSED_NOTIFICATION = @"vvspopoveranimationdiddismissednotification";

typedef NS_ENUM(NSUInteger, VVSTransitionAnimationStyle) {
    
    // stretch
    VVSTransitionAnimationStyleStretchFromTop, // ✅
    VVSTransitionAnimationStyleStretchFromLeft, // ✅
    VVSTransitionAnimationStyleStretchFromRight, // ✅
    VVSTransitionAnimationStyleStretchFromBottom, // ✅
    // present
    VVSTransitionAnimationStylePresentFromTop,
    VVSTransitionAnimationStylePresentFromLeft,
    VVSTransitionAnimationStylePresentFromRight,
    VVSTransitionAnimationStylePresentFromBottom,
    // scale
    VVSTransitionAnimationStyleScaleFromCenter, // ✅
    VVSTransitionAnimationStyleScaleFromTopCenter, // ✅
    VVSTransitionAnimationStyleScaleFromLeftCenter, // ✅
    VVSTransitionAnimationStyleScaleFromRightCenter, // ✅
    VVSTransitionAnimationStyleScaleFromBottomCenter, // ✅
    
    VVSTransitionAnimationStyleScaleFromTopLeft, // ✅
    VVSTransitionAnimationStyleScaleFromTopRight, // ✅
    VVSTransitionAnimationStyleScaleFromBottomLeft, // ✅
    VVSTransitionAnimationStyleScaleFromBottomRight, // ✅
    
    // fade
    VVSTransitionAnimationStyleFade, 

};

@interface VVSPopoverAnimationManager : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>

UIKIT_EXTERN NSString * const VVS_POPOVER_ANIMATION_DID_PRESENTED_NOTIFICATION;
UIKIT_EXTERN NSString * const VVS_POPOVER_ANIMATION_DID_DISMISSED_NOTIFICATION;

/**
 *  被展现的视图的frame
 */
@property(nonatomic,assign) CGRect presentedViewFrame;
/**
 *  点击蒙版是否响应事件
 */
@property(nonatomic,assign,getter=isConverViewResponse) BOOL coverViewResponse;
/**
 *  转场动画时间
 *  默认0.5秒
 */
@property(nonatomic,assign) NSTimeInterval transitionDuration;
/**
 *  转场是否动画
 *  默认有动画
 */
@property(nonatomic,assign,getter=isAnimatable) BOOL animatable;
/**
 *  透明度是否动画
 *  默认没有
 */
@property(nonatomic,assign,getter=isAlphaAnimatable) BOOL alphaAnimatable;

/**
 *  转场样式
 *  默认值 VVSTransitionAnimationStyleStretchFromTop
 */
@property(nonatomic,assign) VVSTransitionAnimationStyle transitionAnimationStyle;
/**
 *  是否有蒙版
 *  默认有
 */
@property(nonatomic,assign,getter=isHasCoverView) BOOL hasConverView;
/**
 *  发起转场的源控制器的view
 */
@property(nonatomic,weak) UIView *sourceView;
@end
