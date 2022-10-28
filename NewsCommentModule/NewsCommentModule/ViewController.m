//
//  ViewController.m
//  NewsCommentModule
//
//  Created by power on 2022/10/18.
//

#import "ViewController.h"
#import "NewsCommentViewController.h"
#import "UIColor+VK.h"
#import "ZBContentView.h"
#import "CommentInfoModel.h"
#import "UIView+VK.h"

#import "NewsCommentReplyAreaNode.h"
#define ZBRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]



@interface ViewController ()
@property (nonatomic, strong) UILabel *nameTextNode;


@property (nonatomic, strong) NewsCommentReplyAreaNode *commentReplyAreaNode;


@property (nonatomic,strong) NSMutableArray *inputData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    {
        
        UILabel *nameTextNode = [[UILabel alloc] init];
        nameTextNode.font = [UIFont systemFontOfSize:14];
        nameTextNode.textColor = VKColorRGB(186, 177, 161);
        nameTextNode.textAlignment = NSTextAlignmentLeft;
        nameTextNode.backgroundColor = [UIColor orangeColor];
        nameTextNode.numberOfLines = 0;
        nameTextNode.text = @"#物业费回馈季#储奶袋看基础你觉得呢从杰克丹尼曾经的你曾经的你cdjncjdncdjncdjnc内存卡电脑查看带你吃nckdnckdnc    ncdncdknc    kcnkdnckdnc   cndknckdnckdnckdn  nnn";
        
        
        CGFloat TitleHeight = [BOTEmptyObjectFile calculateTitleHeight:nameTextNode.text widthSize:10];
//        NSLog(@"TitleHeight -- %f",TitleHeight);
        
        nameTextNode.frame = CGRectMake(10, 100, SCREEN_WIDTH - 20, TitleHeight);
        [self.view addSubview:nameTextNode];
        
    }
    
    UILabel *nameTextNode = [[UILabel alloc] init];
    nameTextNode.font = [UIFont systemFontOfSize:14];
    nameTextNode.textColor = VKColorRGB(186, 177, 161);
    nameTextNode.textAlignment = NSTextAlignmentCenter;
    nameTextNode.backgroundColor = [UIColor orangeColor];
    nameTextNode.text = @"#物业费回馈季#";
    
    
    CGFloat TitleHeight = [BOTEmptyObjectFile calculateTitleWidth:nameTextNode.text widthSize:10];
//    NSLog(@"TitleHeight -- %f",TitleHeight);
    
    nameTextNode.frame = CGRectMake(10, 150, TitleHeight, 30);
    [self.view addSubview:nameTextNode];
    
    
    [BOTEmptyObjectFile clipCornerWithView:nameTextNode andTopLeft:YES andTopRight:NO andBottomLeft:NO andBottomRight:YES radius:10];
    
    //    // 创建scrollView
    //        UIScrollView *scrollView = [[UIScrollView alloc] init];;
    //        scrollView.backgroundColor = [UIColor redColor];
    //        [self.view addSubview:scrollView];
    //        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.view);
    //        }];
    //
    //        // 创建contentView，添加到scrollView作为唯一子视图
    //        UIView *contentView = [[UIView alloc] init];
    //        contentView.backgroundColor = [UIColor whiteColor];
    //        [scrollView addSubview:contentView];
    //        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
    //            // 设置边距相对于scrollView的约束
    //            make.edges.equalTo(scrollView);
    //            // 设置宽度
    //            make.width.equalTo(scrollView);
    //        }];
    //
    //        UIView *lastView;
    //
    //        for (NSInteger i = 0; i < 10; i++) {
    //            UIView *view = [UIView new];
    //            view.backgroundColor = ZBRandomColor;
    //            [contentView addSubview:view];
    //            [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //                if (i == 0) {
    //                    make.top.equalTo(contentView);
    //                } else {
    //                    make.top.equalTo(lastView.mas_bottom).offset(10);
    //                }
    //                make.left.right.equalTo(contentView);
    //                make.height.mas_equalTo(100);
    //            }];
    //
    //            lastView = view;
    //        }
    //
    //        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
    //            // 设置contentView的底部约束等于最后一个视图底部约束
    //            make.bottom.equalTo(lastView.mas_bottom);
    //        }];
    //
    //
    
    //    NewsCommentViewController *viewController = [[NewsCommentViewController alloc] init];
    ////    viewController.newsID = self.newsIDTextField.text;
    //    [self.navigationController pushViewController:viewController animated:YES];
    //
    //
    
    MessageInfoModel *messageModel = [[MessageInfoModel alloc] init];
    messageModel.userId = [NSString stringWithFormat:@"100%d",@(1)];
    messageModel.content = @"这里是评论内容哦";
    messageModel.commentTime = @"2018-02-03";
    messageModel.praiseCount = [NSString stringWithFormat:@"%d",@(1)];
    messageModel.nickName = [NSString stringWithFormat:@"我是昵称%d",@(1)];
    messageModel.avatar = @"https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500";  //  头像图片
    messageModel.praised = @"1";
    messageModel.commentId = [NSString stringWithFormat:@"200%d",@(1)];
    
    ZBContentView *contentView = [[ZBContentView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置边距相对于scrollView的约束
        //        make.edges.equalTo(self.view);
        // 设置宽度
        make.width.equalTo(self.view);
        make.top.equalTo(nameTextNode.mas_bottom).offset(50);
        make.height.greaterThanOrEqualTo(@20);// view.height >= @20
        //        make.height.lessThanOrEqualTo(@20);view.height <= 20
        
        
    }];
    
    [contentView setupCommentItemsModel:messageModel];
    
    
    
    
    
    
    [self.view addSubview:self.nameTextNode];
    [_nameTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_bottom).offset(10);;
        make.left.equalTo(contentView).offset(10);
        make.right.equalTo(contentView).offset(-10);
        //        make.width.mas_equalTo(200);
        //        make.height.mas_equalTo(30);
    }];
    
    
    [_nameTextNode sizeToFit];
    CGFloat width = ceil(_nameTextNode.frame.size.height) + 1;
//    NSLog(@"width -- %f",width);
    
    [_nameTextNode layoutIfNeeded];// 下面会有关于layoutIfNeeded的介绍
    CGFloat ttagViewHeight = self.nameTextNode.height;
    
//    NSLog(@"ttagViewHeight -- %f",ttagViewHeight);
    
    _nameTextNode.backgroundColor = [UIColor redColor];
    [BOTEmptyObjectFile clipCornerWithView:_nameTextNode andTopLeft:YES andTopRight:NO andBottomLeft:NO andBottomRight:YES radius:5];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.nameTextNode.font = [UIFont systemFontOfSize:15];
        [_nameTextNode layoutIfNeeded];
        [BOTEmptyObjectFile clipCornerWithView:_nameTextNode andTopLeft:YES andTopRight:NO andBottomLeft:NO andBottomRight:YES radius:5];
        
        
        [_nameTextNode sizeToFit];
        CGFloat width = ceil(_nameTextNode.frame.size.width) + 1;
//        NSLog(@"width -- %f",width);
        
        
        CGFloat ttagViewHeight = self.nameTextNode.width;
//        NSLog(@"ttagViewHeight -- %f",ttagViewHeight);
        
        nameTextNode.font = [UIFont systemFontOfSize:15];
        CGFloat TitleHeight = [BOTEmptyObjectFile calculateTitleWidth:nameTextNode.text widthSize:10];
//        NSLog(@"TitleHeight -- %f",TitleHeight);
        nameTextNode.frame = CGRectMake(10, 150, TitleHeight + 10, 30);
        [BOTEmptyObjectFile clipCornerWithView:nameTextNode andTopLeft:YES andTopRight:NO andBottomLeft:NO andBottomRight:YES radius:10];
    });
    
    
    
    
    
    
    
    
    [self.view addSubview:self.commentReplyAreaNode];
    self.commentReplyAreaNode.backgroundColor = [UIColor redColor];
    [self.commentReplyAreaNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextNode.mas_bottom).offset(10);
        make.width.equalTo(self.view);
        //        make.height.equalTo(@200);
    }];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int j = 0;j < 5;j++) {
        CommentInfoModel *mod = [[CommentInfoModel alloc] init];
        mod.replyId = [NSString stringWithFormat:@"400%d",j];
        mod.commentId = @"32265";
        mod.userId = [NSString stringWithFormat:@"300%d",j];
        mod.toUserId = [NSString stringWithFormat:@"100%d",j];
        mod.replyContent = @"我是测试小酱油，测试回复评论的哦，你猜我回复了什么？";
        mod.replyTime = @"2018-08-13";
        mod.nickName = [NSString stringWithFormat:@"一个昵称酱%d",j];
        mod.toNickName = @"昵称有点666";
        mod.toUserImageUrl = @"vk_avatar";
        mod.userImageUrl = @"vk_avatar";
        [arr addObject:mod];
    }
    
    
    [_commentReplyAreaNode setupCommentItemsArr:arr];
    
    
    [self build];
    
}

- (UILabel *)nameTextNode
{
    if (!_nameTextNode) {
        UILabel *nameTextNode = [[UILabel alloc] init];
        nameTextNode.font = [UIFont systemFontOfSize:14];
        nameTextNode.textColor = VKColorRGB(186, 177, 161);
        nameTextNode.numberOfLines = 0;
        nameTextNode.text = @"#物业费回馈季#";
        _nameTextNode = nameTextNode;
    }
    return _nameTextNode;
}


- (NewsCommentReplyAreaNode *)commentReplyAreaNode
{
    if (!_commentReplyAreaNode) {
        NewsCommentReplyAreaNode *commentReplyAreaNode = [[NewsCommentReplyAreaNode alloc] initWithFrame:CGRectZero];
        _commentReplyAreaNode = commentReplyAreaNode;
    }
    return _commentReplyAreaNode;
}



- (void)build {
    self.inputData = [NSMutableArray array];
    NSMutableArray *modelData = [NSMutableArray array];
    
    MessageInfoModel *messageModel = [[MessageInfoModel alloc] init];
    messageModel.userId = [NSString stringWithFormat:@"100%d",0];
    messageModel.content = @"这里是评论内容哦的简欧京东我囧囧的菜农完成无IC从你从你我我哦长尾词那我IC你未成年望长城内外集成呢我才能我哪次";
    messageModel.commentTime = @"2018-02-03";
    messageModel.praiseCount = [NSString stringWithFormat:@"%d",0];
    messageModel.nickName = [NSString stringWithFormat:@"我是昵称%d",0];
    messageModel.avatar = @"https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500";  //  头像图片
    messageModel.praised = @"1";
    messageModel.commentId = [NSString stringWithFormat:@"200%d",0];
    
    
    
    MessageInfoModel *messageModel1 = [[MessageInfoModel alloc] init];
    messageModel1.commentTime = @"2018-02-01";
    messageModel1.nickName = [NSString stringWithFormat:@"我是昵称%d",1];
    

    
    
    
    MessageInfoModel *messageModel2 = [[MessageInfoModel alloc] init];
    messageModel2.commentTime = @"2018-02-10";
    messageModel2.nickName = [NSString stringWithFormat:@"我是昵称%d",2];
    
    
    
    MessageInfoModel *messageModel3 = [[MessageInfoModel alloc] init];
    messageModel3.commentTime = @"2018-02-05";
    messageModel3.nickName = [NSString stringWithFormat:@"我是昵称%d",1];
    
    
    
    MessageInfoModel *messageModel4 = [[MessageInfoModel alloc] init];
    messageModel4.commentTime = @"2018-02-04";
    messageModel4.nickName = [NSString stringWithFormat:@"我是昵称%d",1];
    
    
    
    MessageInfoModel *messageModel5 = [[MessageInfoModel alloc] init];
    messageModel5.commentTime = @"2018-02-08";
    messageModel5.nickName = [NSString stringWithFormat:@"我是昵称%d",1];
    
    MessageInfoModel *messageModel6 = [[MessageInfoModel alloc] init];
    messageModel6.commentTime = @"2018-02-01";
    messageModel6.nickName = [NSString stringWithFormat:@"我是昵称%d",1];
    
    
    [modelData addObject:messageModel];
    [modelData addObject:messageModel1];
    [modelData addObject:messageModel2];
    [modelData addObject:messageModel3];
    [modelData addObject:messageModel4];
    [modelData addObject:messageModel5];
    [modelData addObject:messageModel6];
    
    
    self.inputData = modelData;
    
    
  self.inputData = [BOTEmptyObjectFile arrayWithTimeSeq:modelData];
    
    NSLog(@" self.inputData  ==  %@", [self.inputData yy_modelToJSONObject]);
    
    
    
}







////切指定角的圆角
//- (UIView *)clipCornerWithView:(UIView *)originView
//                    andTopLeft:(BOOL)topLeft
//                   andTopRight:(BOOL)topRight
//                 andBottomLeft:(BOOL)bottomLeft
//                andBottomRight:(BOOL)bottomRight radius:(CGFloat)radius{
//    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:originView.bounds
//                                                   byRoundingCorners:(topLeft==YES ? UIRectCornerTopLeft : 0) |
//                              (topRight==YES ? UIRectCornerTopRight : 0) |
//                              (bottomLeft==YES ? UIRectCornerBottomLeft : 0) |
//                              (bottomRight==YES ? UIRectCornerBottomRight : 0)
//                                                         cornerRadii:CGSizeMake(radius, radius)];
//    // 创建遮罩层
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = originView.bounds;
//    maskLayer.path = maskPath.CGPath;   // 轨迹
//    originView.layer.mask = maskLayer;
//    
//    return originView;
//}
//
//
///*
// 计算文字的高度：
// */
//- (CGFloat)calculateTitleHeight:(NSString*)strTitle {
//    NSLog(@"calculateTitleHeight: %@", strTitle);
//    // 计算出每个Cell的高度
//    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:strTitle];
//    
//    UIFont *font = [UIFont systemFontOfSize:17.0];
//    
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    // TODO: 行间距可以设置成动态的
//    style.lineSpacing = 2; // [self.lineSpaceTextField.text integerValue];
//    
//    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, strTitle.length)];
//    
//    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, strTitle.length)];
//    
////    self.showTextLabel.attributedText = attributeString;
////
////    //        NSLog(@"textView.text.length:%lf", textView.text.length)
//    
//    
//    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
//    
//    CGFloat boundingRectHeight = [attributeString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT) options:options context:nil].size.height;
//    
//    if ([attributeString.string isEqualToString:@""] || [attributeString.string isEqualToString:@"(null)"]) {
//        boundingRectHeight = 0;
//    }
//    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
//    return boundingRectHeight;
//}
//
///*
// 计算文字的宽度
// */
//- (CGFloat)calculateTitleWidth:(NSString*)strTitle {
//    NSLog(@"calculateTitleHeight: %@", strTitle);
//    // 计算出每个Cell的高度
//    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:strTitle];
//    
//    UIFont *font = [UIFont systemFontOfSize:17.0];
//    
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    // TODO: 行间距可以设置成动态的
//    style.lineSpacing = 2; // [self.lineSpaceTextField.text integerValue];
//    
//    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, strTitle.length)];
//    
//    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, strTitle.length)];
//    
////    self.showTextLabel.attributedText = attributeString;
////
////    //        NSLog(@"textView.text.length:%lf", textView.text.length)
//    
//    
//    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
//    
//    CGFloat boundingRectHeight = [attributeString boundingRectWithSize:CGSizeMake(HomePage_Collection_Cell_Title_FrameWidth, MAXFLOAT) options:options context:nil].size.width;
//    
//    if ([attributeString.string isEqualToString:@""] || [attributeString.string isEqualToString:@"(null)"]) {
//        boundingRectHeight = 0;
//    }
//    NSLog(@"boundingRectHeight: %lf", boundingRectHeight);
//    return boundingRectHeight;
//}
@end
