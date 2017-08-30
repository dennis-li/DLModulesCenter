//
//  DLModulesCenter.m
//  DLModulesCenter
//
//  Created by iqiyi on 17/8/25.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import "DLModulesCenter.h"

@interface DLModulesManager ()

@property (nonatomic ,strong) NSMutableDictionary *registerModules;

@end

@implementation DLModulesManager

+ (instancetype) sharedInstance
{
    static dispatch_once_t token;
    static DLModulesManager *modulesManager = nil;
    dispatch_once(&token, ^{
        modulesManager = [[DLModulesManager alloc] init];
        
        modulesManager->_registerModules = [[NSMutableDictionary alloc] init];
        
    });
    return modulesManager;
}

+ (void) registerByModuleID:(NSString *)moduleID className:(NSString *)className
{
    DLModulesManager *modulesManager = [self sharedInstance];
    
    if (moduleID && className) {
        [modulesManager.registerModules setObject:[className description] forKey:[moduleID description]];
    }
    
}

+ (void) openModuleWithParams:(DLModuleParameter *)params
{
    NSString *moduleID = [params.originalParams objectForKey:MODULE_MAIN_SERVICE_ID];
    
    if (moduleID != nil) {
        
        DLModulesManager *modulesManager = [self sharedInstance];
        
        Class moduleClass;
        NSString *className = [modulesManager.registerModules objectForKey:[moduleID description]];
        moduleClass = NSClassFromString([className description]);
        
        id<DLModuleProtocol> module = (id<DLModuleProtocol>)moduleClass;
        
        if ([module respondsToSelector:@selector(launchWithParam:)]) {
            [module launchWithParam:params];
        }
        
    }
}

@end

@implementation DLModuleCallbackData



@end

@implementation DLModuleParameter



@end

