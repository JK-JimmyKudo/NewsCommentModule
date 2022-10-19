//
//  ZBContentView.h
//  NewsCommentModule
//
//  Created by power on 2022/10/19.
//

#import <UIKit/UIKit.h>

#import "MessageInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBContentView : UIView
//UI
@property (nonatomic, strong) UIImageView *imageNode;
@property (nonatomic, strong) UILabel *nameTextNode;
@property (nonatomic, strong) UILabel *locationTextNode;
@property (nonatomic, strong) UIButton *voteBtnNode;
@property (nonatomic, strong) UILabel *contentTextNode;
@property (nonatomic, strong) UIView *underLineNode;
//@property (nonatomic, strong) NewsCommentReplyAreaNode *commentReplyAreaNode;
//Data
//@property (nonatomic, strong) NewsCommentItem *commentItem;

@property (nonatomic, strong) NSDictionary *commentItemsDict;
@property (nonatomic, strong) NSArray *commentIdsArray;


-(void)setupCommentItemsModel:(MessageInfoModel *)model;
@end

NS_ASSUME_NONNULL_END
