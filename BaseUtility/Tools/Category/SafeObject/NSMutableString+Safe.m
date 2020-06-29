//
//  NSMutableString+Safe.m
//  BaseTools
//
//  Created by XueYangLee on 2020/6/29.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "NSMutableString+Safe.h"

@implementation NSMutableString (Safe)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//保证方法替换只被执行一次

        /** substringFromIndex */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSCFString") OriginalSEL:@selector(substringFromIndex:) SwizzleNewSEL:@selector(safe_substringFromIndex:)];
        
        /** substringToIndex */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSCFString") OriginalSEL:@selector(substringToIndex:) SwizzleNewSEL:@selector(safe_substringToIndex:)];
        
        /** substringWithRange */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSCFString") OriginalSEL:@selector(substringWithRange:) SwizzleNewSEL:@selector(safe_substringWithRange:)];
        
        /** rangeOfString: options:range: locale: */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSCFString") OriginalSEL:@selector(rangeOfString:options:range:locale:) SwizzleNewSEL:@selector(safe_rangeOfString:options:range:locale:)];
        
        /** appendString */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSCFString") OriginalSEL:@selector(appendString:) SwizzleNewSEL:@selector(safe_appendString:)];
    });
}


/** 从from位置开始截取字符串  */
- (NSString *)safe_substringFromIndex:(NSUInteger)from {
    if (from > self.length ) {
        return nil;
    }
    return [self safe_substringFromIndex:from];
}

/** 从开始截取到to位置的字符串 */
- (NSString *)safe_substringToIndex:(NSUInteger)to {
    if (to > self.length ) {
        return nil;
    }
    return [self safe_substringToIndex:to];
}

/** 截取指定范围的字符串 */
- (NSString *)safe_substringWithRange:(NSRange)range {
    if (range.location > self.length) {
        return nil;
    }
    
    if (range.length > self.length) {
        return nil;
    }
    
    if ((range.location + range.length) > self.length) {
        return nil;
    }
    return [self safe_substringWithRange:range];
}

/// 搜索指定 字符串
/// @param searchString 指定 字符串
/// @param mask 比较模式
/// @param rangeOfReceiverToSearch 搜索 范围
/// @param locale 本地化
- (NSRange)safe_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale {
    if (!searchString) {
        searchString = self;
    }
    
    if (rangeOfReceiverToSearch.location > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    
    if (rangeOfReceiverToSearch.length > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    
    if ((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length) > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    
    
    return [self safe_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}

/** 追加字符串 */
- (void)safe_appendString:(NSString *)aString {
    if (!aString) {
        return;
    }
    return [self safe_appendString:aString];
}

@end
