//
//  Header.h
//  MoreTab
//
//  Created by xixi on 2019/7/15.
//  Copyright © 2019 xixi. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define APP_Delegate (AppDelegate*)([UIApplication sharedApplication].delegate)

#define XFPUSH_CONTROL_STR(classNameStr){\
[self.navigationController pushViewController:[[NSClassFromString(classNameStr) alloc] init] animated:YES];\
}


#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define WeakId(weakId, idx)  __weak __typeof(&*idx)weakId = idx;
#define kWeakSelf(type)       __weak __typeof__(type) weak##type = type;
#define kStrongSelf(type)   __strong __typeof__(type) strong##type = type;
#define xfWeakSelf       __weak __typeof__(self) weakSelf = self;
#define xfStrongSelf   __strong __typeof__(weakSelf) strongSelf = weakSelf;

#define ImageWithName(name) [UIImage imageNamed:name]
#define ImageWithNameWithAlwaysOriginal(name) [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#define onePx (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET  ((1 / [UIScreen mainScreen].scale) / 2)

//common
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define iphoneX (kStatusBarHeight > 20.f ? YES : NO)

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kNavRealBarHeight 64.0
#define kNavigationBar_HeightForiOS11 (kStatusBarHeight + kNavBarHeight)
#define IPhoneX_AddHeight ([[UIApplication sharedApplication] statusBarFrame].size.height - 20)

#define kTabBar_HeightForiOS11 (iphoneX ? 83 : 49)
#define IOS_VESION [[[UIDevice currentDevice] systemVersion] floatValue]
#define kIphoneXBottomHeight (iphoneX ? 34 : 0)


#endif /* Header_h */
