//
//  SizeCalculator.h
//  UIKitExtensionsExample
//
//  Created by 张鹏 on 2023/5/9.
//  Copyright © 2023 dancewithpeng@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SizeCalculator : NSObject

+ (CGSize)calculateSizeForAttributedString:(NSAttributedString *)attributedString maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
