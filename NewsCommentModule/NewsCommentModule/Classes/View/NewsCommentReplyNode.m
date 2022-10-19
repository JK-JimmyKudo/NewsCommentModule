//
//  NewsCommentReplyNode.m
//  LovePlay
//
//  Created by weiying on 2017/2/6.
//  Copyright © 2017年 Yuns. All rights reserved.
//

#import "NewsCommentReplyNode.h"
#import "NewsCommentModel.h"

#import "UIColor+VK.h"
#import <Masonry/Masonry.h>

@interface NewsCommentReplyNode ()
//UI
@property (nonatomic, strong) UILabel *nameTextNode;
@property (nonatomic, strong) UILabel *floorTextNode;
@property (nonatomic, strong) UILabel *contentTextNode;
@property (nonatomic, strong) UIView *underLineNode;
//Data
@property (nonatomic, strong) NewsCommentItem *commentItem;
@property (nonatomic, assign) NSInteger floor;

@property (nonatomic, strong) CommentInfoModel *model;

@end

@implementation NewsCommentReplyNode


- (instancetype)initWithcommentModel:(CommentInfoModel *)model floor:(NSInteger)floor{
    
    
    self = [super init];
    if (self) {
        _model = model;
        _floor = floor;
        [self addSubnodes];
        [self mas_subViews];
        [self loadData];
    }
    return self;
    
}


#pragma mark - private
- (void)addSubnodes
{
    [self addSubview:self.nameTextNode];
    
    [self addSubview:self.floorTextNode];
    
    [self addSubview:self.contentTextNode];
    
    [self addSubview:self.underLineNode];
}

- (void)mas_subViews
{
    [_floorTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30).priorityLow();
        make.top.equalTo(self).offset(4);
        make.right.equalTo(self).offset(-4);
    }];
    
    [_nameTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(4);
        make.left.equalTo(self).offset(4);
        make.right.equalTo(_floorTextNode.mas_left).offset(-10);
    }];
    
    [_contentTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextNode.mas_bottom).offset(5);
        make.left.equalTo(self).offset(4);
        make.right.equalTo(self).offset(-4);
    }];
    
    [_underLineNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.top.equalTo(_contentTextNode.mas_bottom).offset(4);
        make.left.bottom.right.equalTo(self);
    }];
}

- (void)loadData
{
    
    
//    XJLog(@"nickName -- %@",[self.model nickName]);
//    XJLog(@"toNickName -- %@",[self.model toNickName]);

    
    _nameTextNode.text = [NSString stringWithFormat:@"%@ %@", self.model.nickName ? self.model.nickName : @"火星网友",@"火星"];
    _floorTextNode.text = @"呵呵呵";//[NSString stringWithFormat:@"%@#", @(_floor).stringValue];
    _contentTextNode.text = self.model.replyContent ? self.model.replyContent : @"";
    
    
    if (![self.model.toNickName isEqualToString:@""]) { // XX回复XX
        _nameTextNode.text = [NSString stringWithFormat:@"%@ 回复 %@",
              self.model.nickName, self.model.toNickName];
//        _contentTextNode.text = self.model.replyContent ? self.model.replyContent : @"";
    }else{
        _nameTextNode.text = [NSString stringWithFormat:@"%@",
              self.model.nickName];
    }
}

#pragma mark - setter / getter
- (UILabel *)nameTextNode
{
    if (!_nameTextNode) {
        UILabel *nameTextNode = [[UILabel alloc] init];
        nameTextNode.font = [UIFont systemFontOfSize:12];
        nameTextNode.textColor = VKColorRGB(138, 138, 138);
        _nameTextNode = nameTextNode;
    }
    return _nameTextNode;
}

- (UILabel *)floorTextNode
{
    if (!_floorTextNode) {
        UILabel *floorTextNode = [[UILabel alloc] init];
        floorTextNode.font = [UIFont systemFontOfSize:12];
        floorTextNode.textColor = VKColorRGB(64, 64, 64);
        floorTextNode.textAlignment = NSTextAlignmentRight;
        _floorTextNode = floorTextNode;
    }
    return _floorTextNode;
}

- (UILabel *)contentTextNode
{
    if (!_contentTextNode) {
        UILabel *contentTextNode = [[UILabel alloc] init];
        contentTextNode.numberOfLines = 0;
        contentTextNode.font = [UIFont systemFontOfSize:14];
        contentTextNode.textColor = VKColorRGB(50, 50, 50);
        _contentTextNode = contentTextNode;
    }
    return _contentTextNode;
}

- (UIView *)underLineNode
{
    if (!_underLineNode) {
        UIView *underLineNode = [[UIView alloc] init];
        underLineNode.backgroundColor = VKColorRGB(222, 222, 222);
        _underLineNode = underLineNode;
    }
    return _underLineNode;
}
@end
