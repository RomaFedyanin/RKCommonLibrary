//
//  NSDate+RKNSDateCategory.m
//  
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "NSDate+RKNSDateCategory.h"

@implementation NSDate (RKNSDateCategory)

+ (NSString*)nowStringWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString*)nowString {
    return [self nowStringWithFormat:@"yyyy-MM-dd hh:mm:ss"];
}

+ (NSString*)nowStringDate {
    return [self nowStringWithFormat:@"yyyy-MM-dd"];
}

+ (NSString*)nowStringTime {
    return [self nowStringWithFormat:@"hh:mm:ss"];
}

+ (NSTimeInterval)timeIntervalSince1970 {
    return [NSDate date].timeIntervalSince1970;
}

- (NSString*)stringWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

- (NSString*)string {
    return [self stringWithFormat:@"yyyy-MM-dd hh:mm:ss"];
}

- (NSString*)stringDate {
    return [self stringWithFormat:@"yyyy-MM-dd"];
}

- (NSString*)stringTime {
    return [self stringWithFormat:@"hh:mm:ss"];
}

@end
