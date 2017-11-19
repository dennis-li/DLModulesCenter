//
//  DLModulesCenter.h
//  DLModulesCenter
//
//  Created by iqiyi on 17/8/25.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MODULE_MAIN_SERVICE_ID @"MODULE_MAIN_SERVICE_ID"

@class DLModuleCallbackData;
@class DLModuleParameter;

/**************************注册制协议************************************/
@protocol DLModuleProtocol <NSObject>

/**
 *提供注册制调起的模块必须实现的协议方法
 *该模块必须复写load方法，并将模块本身注册进调度中心
 */
+ (void)launchWithParam:(DLModuleParameter *)param;

@end




/***************************注册制调度中心************************************/
@interface DLModulesManager : NSObject

+ (void) registerByModuleID:(NSString *) moduleID className:(NSString *) className;

+ (void) openModuleWithParams:(DLModuleParameter *) params;

@end



/**************************被调方返回给主调方的数据************************************/
@interface DLModuleCallbackData : NSObject

/**
 *回调数据出错时的错误
 */
@property (nonatomic, strong) NSError *error;

/**
 *回调模块返回的数据，此数据为一个接口
 */
@property (nonatomic, copy) NSDictionary *data;

@end





/**************************注册制调起模块的参数************************************/
typedef void (^DLModuleClose)(DLModuleCallbackData *callbackData);
@interface DLModuleParameter : NSObject

/**
 * 服务器源数据
 * 包括被调方的moduleID，子业务ID，具体业务参数等
 */
@property (nonatomic ,copy) NSDictionary *originalParams;

/**
 *主调方提供入口统计，承载页面的controller，view等
 */
@property (nonatomic ,copy) NSDictionary *localParams;

/**
 *退出模块后调用
 *必须执行回调
 */
@property (nonatomic ,copy) DLModuleClose closeCallBack;

@end

