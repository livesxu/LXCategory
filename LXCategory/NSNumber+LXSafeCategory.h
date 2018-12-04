//
//  NSNumber+LXSafeCategory.h
//  
//
//  Created by Xu小波 on 2018/12/4.
//

#import <Foundation/Foundation.h>

@interface NSNumber (LXSafeCategory)

@property (nonatomic,readonly) NSUInteger length;

- (BOOL)isEqualToString:(NSString *)aString;

- (BOOL)containsString:(NSString *)str;

- (BOOL)hasPrefix:(NSString *)str;

@end
