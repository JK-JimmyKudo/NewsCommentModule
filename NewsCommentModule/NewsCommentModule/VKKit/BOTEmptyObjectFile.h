//
//  BOTEmptyObjectFile.h
//  NewsCommentModule
//
//  Created by power on 2022/10/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MessageInfoModel.h"
#import "HYTimeManager.h"
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
+ (UIView *)clipCornerWithView:(UIView *)originView
                    andTopLeft:(BOOL)topLeft
                   andTopRight:(BOOL)topRight
                 andBottomLeft:(BOOL)bottomLeft
            andBottomRight:(BOOL)bottomRight radius:(CGFloat)radius;


/// iOS 数组按时间戳降序排序
/// @param inputData
+ (NSMutableArray *)arrayWithTimeSeq:(NSMutableArray*)inputData;
@end

NS_ASSUME_NONNULL_END
