//
//  NSObjectDebug.h
//  LearnOjectiveC
//
//  Created by zhongyang on 7/27/15.
//  Copyright (c) 2015 zhongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObjectDebug : NSObject {

}

+ (void)printAllMethods:(Class)cls;
+ (void)printAllIVars:(Class)cls;
+ (void)printAllProperty:(Class)cls;
+ (void)printAllProtocols:(Class)cls;

+ (BOOL)isMetaClass:(Class)cls;
+ (Class)getSuperClass:(Class)cls;
+ (Class)getRootSuperClass:(Class)cls;

@end
