//
//  RKCL.m
//  DOCommonElements
//
//  Created by Roman Kotov on 16.12.14.
//  Copyright (c) 2014 Roman Kotov. All rights reserved.
//

#import "RKCL.h"

@implementation RKCL : NSObject

+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock finalyBlock:(void (^)())finalyBlock {
    @try {
        if (block) {
            block();
        }
    }
    @catch (NSException *exception) {
        if (catchBlock) {
            catchBlock(exception);
        } else {
            DOLog(@"Exception: %@", exception.description);
        }
    }
    @finally {
        if (finalyBlock) {
            finalyBlock();
        }
    }
}

+ (void)safeWithBlock:(void (^)())block catchBlock:(void (^)(NSException *exception))catchBlock {
    [self safeWithBlock:block catchBlock:catchBlock finalyBlock:nil];
}

+ (void)safeWithBlock:(void (^)())block {
    [self safeWithBlock:block catchBlock:nil finalyBlock:nil];
}

+ (void)performBlock:(void (^)())block delay:(NSTimeInterval)delay {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        block();
    });
}

+ (void)clearCookies {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies)
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    DOLog(@"Cookies очищены!");
}

+ (CGSize)frameForText:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size {
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    CGRect frame = [text boundingRectWithSize:size
                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:attributesDictionary
                                      context:nil];
    
    return frame.size;
}

@end