//
//  SizeCalculator.m
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2023/5/9.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

#import "SizeCalculator.h"
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@implementation SizeCalculator

+ (CGSize)calculateSizeForAttributedString:(NSAttributedString *)attributedString maxSize:(CGSize)maxSize {
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);

    CGSize constraints = maxSize;
    CFRange fitRange = CFRangeMake(0, 0);
//    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, attributedString.length), NULL, constraints, &fitRange);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, maxSize.width, maxSize.height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedString.length), path, NULL);

    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    
    CGPoint origins[lines.count];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 2), origins);
    
    CGFloat maxWidth = 0;
    
    for (int i=0; i<lines.count; i++) {
        id lineObj = lines[i];
        CTLineRef line = (__bridge CTLineRef)lineObj;
        CGFloat ascent, descent, leading;
        CGFloat width = CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
        CGFloat lineHeight = ascent + descent + leading;
        CGPoint origin = origins[i];
        NSLog(@"----%@", NSStringFromCGPoint(origin));
        
        maxWidth = MAX(maxWidth, width);
    }

    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    
    return CGSizeMake(maxWidth, 200);
}

@end
