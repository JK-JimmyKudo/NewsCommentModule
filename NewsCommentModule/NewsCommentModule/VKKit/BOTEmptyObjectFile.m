//
//  BOTEmptyObjectFile.m
//  NewsCommentModule
//
//  Created by power on 2022/10/28.
//

#import "BOTEmptyObjectFile.h"

@implementation BOTEmptyObjectFile
//切指定角的圆角
+ (void)clipCornerWithView:(UIView *)originView
                    andTopLeft:(BOOL)topLeft
                   andTopRight:(BOOL)topRight
                 andBottomLeft:(BOOL)bottomLeft
                andBottomRight:(BOOL)bottomRight radius:(CGFloat)radius{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:originView.bounds
                                                   byRoundingCorners:(topLeft==YES ? UIRectCornerTopLeft : 0) |
                              (topRight==YES ? UIRectCornerTopRight : 0) |
                              (bottomLeft==YES ? UIRectCornerBottomLeft : 0) |
                              (bottomRight==YES ? UIRectCornerBottomRight : 0)
                                                         cornerRadii:CGSizeMake(radius, radius)];
    // 创建遮罩层
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = originView.bounds;
    maskLayer.path = maskPath.CGPath;   // 轨迹
    originView.layer.mask = maskLayer;
    
}


/*
 计算文字的高度：
 */
+ (CGFloat)calculateTitleHeight:(NSString*)strTitle widthSize:(CGFloat)width{
    NSLog(@"calculateTitleHeight: %@", strTitle);
    // 计算出每个Cell的高度
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:strTitle];
    
    UIFont *font = [UIFont systemFontOfSize:17.0];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    // TODO: 行间距可以设置成动态的
    style.lineSpacing = 2; // [self.lineSpaceTextField.text integerValue];
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, strTitle.length)];
    
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, strTitle.length)];
    
//    self.showTextLabel.attributedText = attributeString;
//
//    //        NSLog(@"textView.text.length:%lf", textView.text.length)
    
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGFloat boundingRectHeight = [attributeString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT) options:options context:nil].size.height;
    
    if ([attributeString.string isEqualToString:@""] || [attributeString.string isEqualToString:@"(null)"]) {
        boundingRectHeight = 0;
    }
    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
    return boundingRectHeight;
}

/*
 计算文字的宽度
 */
+ (CGFloat)calculateTitleWidth:(NSString*)strTitle widthSize:(CGFloat)width{
    NSLog(@"calculateTitleHeight: %@", strTitle);
    // 计算出每个Cell的高度
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:strTitle];
    
    UIFont *font = [UIFont systemFontOfSize:17.0];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    // TODO: 行间距可以设置成动态的
    style.lineSpacing = 2; // [self.lineSpaceTextField.text integerValue];
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, strTitle.length)];
    
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, strTitle.length)];
    
//    self.showTextLabel.attributedText = attributeString;
//
//    //        NSLog(@"textView.text.length:%lf", textView.text.length)
    
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGFloat boundingRectHeight = [attributeString boundingRectWithSize:CGSizeMake(HomePage_Collection_Cell_Title_FrameWidth, MAXFLOAT) options:options context:nil].size.width;
    
    if ([attributeString.string isEqualToString:@""] || [attributeString.string isEqualToString:@"(null)"]) {
        boundingRectHeight = 0;
    }
    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
    return boundingRectHeight;
}
@end
