//
//  NewsCommentReplyAreaNode.m
//  LovePlay
//
//  Created by weiying on 2017/2/6.
//  Copyright © 2017年 Yuns. All rights reserved.
//

#import "NewsCommentReplyAreaNode.h"
#import "NewsCommentModel.h"
#import "NewsCommentReplyNode.h"

#import "CommentInfoModel.h"
#import "UIColor+VK.h"
#import <Masonry/Masonry.h>
#import "NewsCommentReplyCellNode.h"
@interface NewsCommentReplyAreaNode ()<UITableViewDelegate, UITableViewDataSource>
//UI
@property (nonatomic, strong) NewsCommentReplyNode *commentReplyNode;
//Data
@property (nonatomic, strong) NSDictionary *commentItemsDict;
@property (nonatomic, strong) NSArray *floors;

@property (nonatomic, strong) NSArray *replyList;

@property (nonatomic, strong) UITableView *tableNode;
@end

@implementation NewsCommentReplyAreaNode

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = VKColorRGB(248, 249, 241);
        self.layer.borderColor = VKColorRGB(218, 218, 218).CGColor;
        self.layer.borderWidth = 0.5;
//        [self addTableNode];
    }
    return self;
}


- (void)addTableNode
{
    [self addSubview:self.tableNode];
    //使用masonry刷新横竖屏切换布局
    [_tableNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
//        make.top.equalTo(self);
//        make.height.greaterThanOrEqualTo(@300);
////        make.bottom.equalTo(self);
    }];
}



#pragma mark - private
- (void)addNewSubnodes
{
    UIView *lastTopView;
    for (NSInteger i = 0; i < self.replyList.count; i ++) {

        CommentInfoModel *model = [self.replyList safeObjectAtIndex:i];
        
//        XJLog(@"setupCommentItemsArr -- %@",[model yy_modelToJSONObject]);

        NewsCommentReplyNode *commentReplyNode = [[NewsCommentReplyNode alloc]initWithcommentModel:model floor:i];
//        commentReplyNode.hidden = YES;
        [self addSubview:commentReplyNode];

        //mas_layout
        [self mas_newSubViewsWithIndex:i commentReplyNode:commentReplyNode lastTopView:lastTopView];
        
        lastTopView = commentReplyNode;
    }
    
//    [_tableNode mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(lastTopView);
//    }];
}

- (void)mas_newSubViewsWithIndex:(NSInteger)index commentReplyNode:(NewsCommentReplyNode *)commentReplyNode lastTopView:(UIView *)lastTopView
{
    if (0 == index) {
        [commentReplyNode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.right.equalTo(self);
        }];
    }else{
        [commentReplyNode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastTopView.mas_bottom);
            make.left.right.equalTo(self);
        }];
    }
    
    if (index == self.replyList.count-1) {
        [commentReplyNode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
        }];
        
    }
}


#pragma mark - public

-(void)setupCommentItemsArr:(NSArray *)replyList{
    self.replyList = [NSArray array];
    self.replyList = replyList;
    [self.tableNode reloadData];

//
    [self removeAllSubviews];
//    [self addTableNode];
    [self addNewSubnodes];
    
}
- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}





#pragma mark - tableView dataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.replyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCommentReplyCellNode *cell = [NewsCommentReplyCellNode cellWithTableView:tableView];

       CommentInfoModel *model = [self.replyList safeObjectAtIndex:indexPath.row];
       
    [cell setupCommentItemsModel:model];
        
    
    return cell;
}

#pragma mark - tableView delegate
#pragma mark - tableView delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
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


//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 200;
//}

- (UITableView *)tableNode
{
    if (!_tableNode) {
        UITableView *tableNode = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        tableNode.backgroundColor = [UIColor whiteColor];
        tableNode.delegate = self;
        tableNode.dataSource = self;
        tableNode.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableNode.rowHeight = UITableViewAutomaticDimension;
        tableNode.estimatedRowHeight = 100;
        tableNode.scrollEnabled = NO;
        _tableNode = tableNode;
    }
    return _tableNode;
}

@end
