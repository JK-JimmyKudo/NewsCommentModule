//
//  NewsCommentViewController.m
//  LovePlay
//
//  Created by Yuns on 2017/1/29.
//  Copyright © 2017年 Yuns. All rights reserved.
//

#import "NewsCommentViewController.h"
//M
#import "NewsCommentModel.h"
//V
#import "NewsCommentCellNode.h"
#import "NewsCommentSectionTitleHeader.h"
//Tool
//#import "YYKit.h"
#import <Masonry/Masonry.h>
#import <YYModel/YYModel.h>

#import "MessageInfoModel.h"
#import "CommentInfoModel.h"


@interface NewsCommentViewController ()<UITableViewDelegate, UITableViewDataSource>
//UI
@property (nonatomic, strong) UITableView *tableNode;
//Data
@property (nonatomic, strong) NewsCommentModel *hotComments;
//@property (nonatomic, strong) NewsCommentModel *latestComments;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger pageSize;


@property (nonatomic, strong) NSMutableArray *latestCommentArr;





@end

@implementation NewsCommentViewController

NSString * const NewsHotCommentHost = @"/news/v2/hottie";
NSString * const NewsLatestCommentHost = @"/news/v2/newtie";

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initParams];
    [self addTableNode];
    [self loadData];
}

#pragma mark - init
- (void)initParams
{
    _pageIndex = 0;
    _pageSize = 10;
}

- (void)addTableNode
{
    [self.view addSubview:self.tableNode];
    //使用masonry刷新横竖屏切换布局
    [_tableNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)loadData
{
//    [self loadHotCommentData];
    [self build];
}

- (void)build {
    
    NSMutableArray *modelData = [NSMutableArray array];
    for (int i = 0;i < 25;i++) {
        MessageInfoModel *messageModel = [[MessageInfoModel alloc] init];
        messageModel.userId = [NSString stringWithFormat:@"100%d",i];
        messageModel.content = @"这里是评论内容哦";
        messageModel.commentTime = @"2018-02-03";
        messageModel.praiseCount = [NSString stringWithFormat:@"%d",i];
        messageModel.nickName = [NSString stringWithFormat:@"我是昵称%d",i];
        messageModel.avatar = @"https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500";  //  头像图片
        messageModel.praised = @"1";
        messageModel.commentId = [NSString stringWithFormat:@"200%d",i];
        
        NSMutableArray *arr = [NSMutableArray array];
        
        for (int j = 0;j < i;j++) {
            CommentInfoModel *mod = [[CommentInfoModel alloc] init];
            
            mod.replyId = [NSString stringWithFormat:@"400%d",j];
            mod.commentId = @"32265";
            mod.userId = [NSString stringWithFormat:@"300%d",j];
            mod.toUserId = [NSString stringWithFormat:@"100%d",i];
            mod.replyContent = @"我是测试小酱油，测试回复评论的哦，你猜我回复了什么？";
            mod.replyTime = @"2018-08-13";
            mod.nickName = [NSString stringWithFormat:@"一个昵称酱%d",j];
            mod.toNickName = @"昵称有点666";
            mod.toUserImageUrl = @"vk_avatar";
            mod.userImageUrl = @"vk_avatar";
            
            [arr addObject:mod];
        }
        
        messageModel.replyList = arr;
        
        [modelData addObject:messageModel];
    }
//    [self.feedEntitySections addObject:modelData];
    
    
    self.latestCommentArr = modelData;
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.commentTableView reloadData];
    });
    
    
}










- (void)loadHotCommentData
{
//    NSString *urlString = [NSString stringWithFormat:@"%@/%@/0/10/11/2/2",NewsHotCommentHost, _newsID];
//    [[HttpRequest sharedInstance] GET:urlString parameters:nil success:^(id response) {
//        NSLog(@"list-succ : %@", response);
    
    
   NSDictionary *response = @{@"name" :@"n",
                  
                  @"page" :@"p",

                  @"desc" :@"ext.desc",

                  @"bookID" :@[@"id",@"ID",@"book_id"]};
    
    [NewsCommentItem yy_modelToJSONObject];
        NewsCommentModel *commentModel = [NewsCommentModel yy_modelWithJSON:response];
//        _hotComments = commentModel;
    
    
    
    
    
        [self loadLatestCommentData];
//    } failure:^(NSError *error) {
//        NSLog(@"list-fail : %@", error);
//    }];
}

- (void)loadLatestCommentData
{
//    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%ld/%ld/6/2/2",NewsLatestCommentHost, _newsID, _pageIndex * _pageSize, _pageSize];
//    [[HttpRequest sharedInstance] GET:urlString parameters:nil success:^(id response) {
//        NSLog(@"list-succ : %@", response);
    NSDictionary *response = @{@"name" :@"n",
                   
                   @"page" :@"p",

                   @"desc" :@"ext.desc",

                   @"bookID" :@[@"id",@"ID",@"book_id"]};
//        NewsCommentModel *commentModel = [NewsCommentModel modelWithJSON:response];
//        _latestComments = commentModel;
    
        [_tableNode reloadData];
//    } failure:^(NSError *error) {
//        NSLog(@"list-fail : %@", error);
//    }];
}

#pragma mark - tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return _hotComments.commentIds.count;
    }else{
        return self.latestCommentArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCommentCellNode *cell = [NewsCommentCellNode cellWithTableView:tableView];
    if (0 == indexPath.section) {
//        [cell setupCommentItems:_hotComments.comments commmentIds:_hotComments.commentIds[indexPath.row]];
    }else{
//        [cell setupCommentItems:_latestComments.comments commmentIds:_latestComments.commentIds[indexPath.row]];
       MessageInfoModel *model = [self.latestCommentArr safeObjectAtIndex:indexPath.row];
       [cell setupCommentItemsModel:model];
        
    }
    return cell;
}

#pragma mark - tableView delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NewsCommentSectionTitleHeader *headerView = [NewsCommentSectionTitleHeader sectionHeaderWithTableView:tableView];

    switch (section) {
        case 0:
        {
            if (_hotComments.comments.count > 0) {
                headerView.title = @"热门跟帖";
            }else{
                return nil;
            }
            
        }
            break;
        case 1:
        {
            if (self.latestCommentArr.count > 0) {
                headerView.title = @"最新跟帖";
            }else{
                return nil;
            }
        }
            break;
        default:
            return nil;
            break;
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            if (_hotComments.comments.count > 0) {
                return 30;
            }
        }
            break;
        case 1:
        {
            if (self.latestCommentArr.count > 0) {
                return 30;
            }
        }
            break;
        default:
            return CGFLOAT_MIN;
            break;
    }
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

#pragma mark -  setter / getter
- (UITableView *)tableNode
{
    if (!_tableNode) {
        UITableView *tableNode = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableNode.backgroundColor = [UIColor whiteColor];
        tableNode.delegate = self;
        tableNode.dataSource = self;
        tableNode.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableNode.rowHeight = UITableViewAutomaticDimension;
        tableNode.estimatedRowHeight = 100;
        _tableNode = tableNode;
    }
    return _tableNode;
}


-(NSMutableArray *)latestCommentArr{
    if (!_latestCommentArr) {
        _latestCommentArr = [NSMutableArray array];
    }
    return _latestCommentArr;
}

#pragma mark - other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
