//
//  AppDelegate.h
//  UIPickerViewDemo
//
//  Created by Eric Lin on 11/9/26.
//  Copyright (c) 2011年 EraSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

extern NSString *const FBSessionStateChangedNotification;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (void) closeSession;

@property (strong, nonatomic) UIWindow *window;

@end
