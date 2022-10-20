//
//  NewsCommentReplyNode.h
//  LovePlay
//
//  Created by weiying on 2017/2/6.
//  Copyright © 2017年 Yuns. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommentInfoModel.h"


@interface NewsCommentReplyCellNode : UITableViewCell


#pragma mark - interface
+ (instancetype)cellWithTableView:(UITableView *)tableView;

#pragma mark - interface


//- (instancetype)initWithcommentModel:(CommentInfoModel *)model floor:(NSInteger)floor;

-(void)setupCommentItemsModel:(CommentInfoModel *)model;
@end
