//
//  BOTEmptyObjectFile.m
//  NewsCommentModule
//
//  Created by power on 2022/10/28.
//

#import "BOTEmptyObjectFile.h"

@implementation BOTEmptyObjectFile
//切指定角的圆角
+ (UIView *)clipCornerWithView:(UIView *)originView
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
    return originView;
}


/*
 计算文字的高度：
 */
+ (CGFloat)calculateTitleHeight:(NSString*)strTitle widthSize:(CGFloat)width{
//    NSLog(@"calculateTitleHeight: %@", strTitle);
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
//    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
    return boundingRectHeight;
}

/*
 计算文字的宽度
 */
+ (CGFloat)calculateTitleWidth:(NSString*)strTitle widthSize:(CGFloat)width{
//    NSLog(@"calculateTitleHeight: %@", strTitle);
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
//    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
    return boundingRectHeight;
}


+ (NSMutableArray *)arrayWithTimeSeq:(NSMutableArray*)inputData{
    //模型中time为时间戳
    for (int i = 0; i < inputData.count; i ++) {
        MessageInfoModel *model = inputData[i];
        NSLog(@"排序前 == %@", model.commentTime);
    }
    NSLog(@"\n");
    // 时间戳数组(存放时间NSDate对象用于排序)
    NSMutableArray *timeArr = [[NSMutableArray alloc]init];
    // 时间戳-对象字典，将对象和其对应的时间戳字符串存入字典（哈希表）
    NSMutableDictionary *dateKeyArr = [[NSMutableDictionary alloc]init];
    // 时间戳取出，并格式化处理
    for(MessageInfoModel *model in inputData) {
        // 1.时间戳转成时间对象用于排序
        NSString *commentTime =[HYTimeManager timeToTimeStamp:model.commentTime DateFormat:@"YYYY-MM-dd" withMs:NO];
        [timeArr addObject:commentTime];
        // 2.时间戳转成时间戳字符串作为key,制作哈希表=
        [dateKeyArr setObject:model forKey:model.commentTime];
    }
    
    NSLog(@"timeArr -- %@",timeArr);
    NSLog(@"dateKeyArr -- %@",dateKeyArr);
    
    //    // 3.将时间NSDate数组排序
    NSArray *orderedDateArray = [timeArr sortedArrayUsingComparator:^NSComparisonResult(NSDate *date1, NSDate *date2) {
        // 降序排序，最近的时间靠前
//        return [date2 compare:date1];
        // 升序排序，较小时间靠前
        return [date1 compare:date2];
    }];
    
    NSLog(@"orderedDateArray -- %@",orderedDateArray);
    
//    // 根据排序好的时间数组对号入座将对象按时间排序
//    // 临时数组，保存排序后的对象数组
    NSMutableArray *sortedAccounts = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<orderedDateArray.count; i++) {
       NSString *datekey = orderedDateArray[i];
        // 日期对象转换成时间戳字符串key
        NSString *strDate = [HYTimeManager timeStampToTime:datekey DateFormat:@"YYYY-MM-dd" withMs:NO];
        // 根据时间戳字符串key取对应的对象（哈希表）
        [sortedAccounts addObject:[dateKeyArr objectForKey:strDate]];
    }
    NSLog(@"sortedAccounts -- %@",sortedAccounts);
    
    for (int j = 0; j < sortedAccounts.count; j ++) {
        MessageInfoModel *model = [sortedAccounts safeObjectAtIndex: j];
        NSLog(@"排序后 == %@", model.commentTime);
    }
    
    
//    for (int i = 0; i < timeArr.count; i++) {
//        for (int j = i+1; j < timeArr.count; j++) {
//            if ([timeArr[i] intValue] < [timeArr[j] intValue]) {
//                [timeArr exchangeObjectAtIndex:i withObjectAtIndex:j];
//                [keys exchangeObjectAtIndex:i withObjectAtIndex:j];
//            }
//        }
//    }
//
//    NSLog(@"timeArr -- %@",timeArr);
//    NSLog(@"keys -- %@",keys);
    
    //  降序
//    1.sortedArrayUsingComparator这个方法本身就是按递增的方式排序。
//    2.返回的返回值（NSOrderedAscending 不交换，NSOrderedSame 不交换，NSOrderedDescending 交换）。
//    3.NSOrderedSame 不做改变
//    例如：object1 < object2 返回：NSOrderedDescending 则交换（变为object2，object1），数组变为降序 。返回NSOrderedAscending，两者不交换， 数组变为升序。


//        NSArray *tMlist = @[@1,@5,@2,@6,@3,@7,@9];
//        NSArray *tArray = [tMlist sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//                               NSNumber *tNumber1 = (NSNumber *)obj1;
//                               NSNumber *tNumber2 = (NSNumber *)obj2;
//                               // 因为不满足sortedArrayUsingComparator方法的默认排序顺序，则需要交换
//                               if ([tNumber1 integerValue] < [tNumber2 integerValue]) return NSOrderedDescending;
//                               return NSOrderedAscending;
//                           }];
//
//        NSLog(@"降序%@",tArray.description);
    
    
//    NSArray *tMlist = @[@1,@5,@2,@6,@3,@7,@9];
//        NSArray *tArray = [tMlist sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//                               NSNumber *tNumber1 = (NSNumber *)obj1;
//                               NSNumber *tNumber2 = (NSNumber *)obj2;
//                               // 因为满足sortedArrayUsingComparator方法的默认排序顺序，则不需要交换
//                               if ([tNumber1 integerValue] < [tNumber2 integerValue]) return NSOrderedAscending;
//                               return NSOrderedDescending;
//                           }];
//        NSLog(@"升序%@",tArray.description);
    
//
//    NSArray *tMlist = @[@1,@5,@2,@6,@3,@7,@9];
//        NSArray *tArray = [tMlist sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
//                               // 数组逆转
//                               return NSOrderedDescending;
//                           }];
//        NSLog(@"数组逆转%@",tArray.description);
    
    return sortedAccounts;
}
@end
