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
#define ZBRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
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
        make.top.equalTo(@100);
        make.height.greaterThanOrEqualTo(@20);// view.height >= @20
//        make.height.lessThanOrEqualTo(@20);view.height <= 20

        
    }];
    
    [contentView setupCommentItemsModel:messageModel];
    
    
}


@end
