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

@interface NewsCommentReplyAreaNode ()
//UI
@property (nonatomic, strong) NewsCommentReplyNode *commentReplyNode;
//Data
@property (nonatomic, strong) NSDictionary *commentItemsDict;
@property (nonatomic, strong) NSArray *floors;

@property (nonatomic, strong) NSArray *replyList;

@end

@implementation NewsCommentReplyAreaNode

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = VKColorRGB(248, 249, 241);
        self.layer.borderColor = VKColorRGB(218, 218, 218).CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}


#pragma mark - private
- (void)addNewSubnodes
{
    UIView *lastTopView;
    for (NSInteger i = 0; i < self.replyList.count; i ++) {

        CommentInfoModel *model = [self.replyList safeObjectAtIndex:i];
        
        XJLog(@"setupCommentItemsArr -- %@",[model yy_modelToJSONObject]);

        NewsCommentReplyNode *commentReplyNode = [[NewsCommentReplyNode alloc]initWithcommentModel:model floor:i];

        [self addSubview:commentReplyNode];

        //mas_layout
        [self mas_newSubViewsWithIndex:i commentReplyNode:commentReplyNode lastTopView:lastTopView];
        
        lastTopView = commentReplyNode;
    }
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


    [self removeAllSubviews];
    
    [self addNewSubnodes];
}
- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}



@end
