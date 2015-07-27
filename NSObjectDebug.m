//
//  NSObjectDebug.m
//  LearnOjectiveC
//
//  Created by zhongyang on 7/27/15.
//  Copyright (c) 2015 zhongyang. All rights reserved.
//

#import "NSObjectDebug.h"
#import <objc/runtime.h>

@implementation NSObjectDebug

#pragma mark - Print Methods For Debug

+ (void)printAllMethods:(Class)cls {
    unsigned int methods_count = 0;
    Method *methods = class_copyMethodList(cls, &methods_count);
    for (int i =0; i<methods_count; i++) {
        Method method = methods[i];
        NSLog(@"Method -- %s", sel_getName(method_getName(method)));
    }
    free(methods);
}

+ (void)printAllIVars:(Class)cls {
    unsigned int ivars_count = 0;
    Ivar *ivars = class_copyIvarList(cls, &ivars_count);
    for (int i=0; i<ivars_count; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"Ivar -- %s", ivar_getName(ivar));
    }
    free(ivars);
}

+ (void)printAllProperty:(Class)cls {
    unsigned int proprty_count = 0;
    objc_property_t *properties = class_copyPropertyList(cls, &proprty_count);
    for (int i=0; i<proprty_count; i++) {
        objc_property_t property = properties[i];
        NSLog(@"Property -- %s", property_getName(property));
    }
    free(properties);
}

+ (void)printAllProtocols:(Class)cls {
    unsigned int protocol_count = 0;
    Protocol * __unsafe_unretained * protocols = class_copyProtocolList(cls, &protocol_count);
    for (int i=0; i<protocol_count; i++) {
        Protocol *protocol = protocols[i];
        NSLog(@"Protocol -- %s", protocol_getName(protocol));
    }
    free(protocols);
}

#pragma mark - Class Inherit

+ (BOOL)isMetaClass:(Class)cls {
    return class_getSuperclass(cls) == nil;
}

+ (Class)getSuperClass:(Class)cls {
    return class_getSuperclass(cls);
}

+ (Class)getRootSuperClass:(Class)cls {
    Class root_class = [NSObjectDebug getSuperClass:cls];
    if ([NSObjectDebug isMetaClass:root_class]) {
        return root_class;
    }
    return [NSObjectDebug getRootSuperClass:root_class];
}


@end
