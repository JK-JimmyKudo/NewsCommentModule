//
//  BOTEmptyObjectFile.h
//  NewsCommentModule
//
//  Created by power on 2022/10/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BOTEmptyObjectFile : NSObject


/*
 计算文字的宽度
 */
+ (CGFloat)calculateTitleWidth:(NSString*)strTitle widthSize:(CGFloat)width;


/*
 计算文字的高度：
 */
+ (CGFloat)calculateTitleHeight:(NSString*)strTitle widthSize:(CGFloat)width;

//切指定角的圆角
+ (void)clipCornerWithView:(UIView *)originView
                    andTopLeft:(BOOL)topLeft
                   andTopRight:(BOOL)topRight
                 andBottomLeft:(BOOL)bottomLeft
            andBottomRight:(BOOL)bottomRight radius:(CGFloat)radius;


@end

NS_ASSUME_NONNULL_END
