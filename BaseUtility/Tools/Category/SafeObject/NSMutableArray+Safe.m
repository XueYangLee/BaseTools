//
//  NSMutableArray+Safe.m
//  BaseTools
//
//  Created by XueYangLee on 2020/6/29.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//保证方法替换只被执行一次
        
        /** objectAtIndex */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSArrayM") OriginalSEL:@selector(objectAtIndex:) SwizzleNewSEL:@selector(safe_mutable_objectAtIndex:)];
        
        /** removeObjectsInRange */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSArrayM") OriginalSEL:@selector(removeObjectsInRange:) SwizzleNewSEL:@selector(safe_mutable_removeObjectsInRange:)];
        
        /** removeObject: inRange: */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSArrayM") OriginalSEL:@selector(removeObject:inRange:) SwizzleNewSEL:@selector(safe_mutable_removeObject:inRange:)];
        
        /** insertObject: atIndex: */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSArrayM") OriginalSEL:@selector(insertObject:atIndex:) SwizzleNewSEL:@selector(safe_mutable_insertObject:atIndex:)];
        
        /** objectAtIndexedSubscript */
        [self swizzleInstanceMethodWithClass:NSClassFromString(@"__NSArrayM") OriginalSEL:@selector(objectAtIndexedSubscript:) SwizzleNewSEL:@selector(safe_mutable_objectAtIndexedSubscript:)];
    });
}

- (id)safe_mutable_objectAtIndex:(NSUInteger)index{
    if (index >= self.count || !self.count){
        return nil;
    }
    return [self safe_mutable_objectAtIndex:index];
}

- (void)safe_mutable_removeObjectsInRange:(NSRange)range {
    
    if (range.location > self.count) {
        return;
    }
    
    if (range.length > self.count) {
        return;
    }
    
    if ((range.location + range.length) > self.count) {
        return;
    }
    
    return [self safe_mutable_removeObjectsInRange:range];
}

- (void)safe_mutable_removeObject:(id)anObject inRange:(NSRange)range {
    if (range.location > self.count) {
        return;
    }
    
    if (range.length > self.count) {
        return;
    }
    
    if ((range.location + range.length) > self.count) {
        return;
    }
    
    if (!anObject){
        return;
    }
    
    return [self safe_mutable_removeObject:anObject inRange:range];
}

- (void)safe_mutable_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > self.count) {
        return;
    }
    
    if (!anObject){
        return;
    }
    
    [self safe_mutable_insertObject:anObject atIndex:index];
}

- (id)safe_mutable_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count || !self.count){
        return nil;
    }
    return [self safe_mutable_objectAtIndexedSubscript:idx];
}

@end
