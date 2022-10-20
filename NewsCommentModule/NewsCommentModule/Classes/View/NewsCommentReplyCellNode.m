//
//  NewsCommentReplyNode.m
//  LovePlay
//
//  Created by weiying on 2017/2/6.
//  Copyright © 2017年 Yuns. All rights reserved.
//

#import "NewsCommentReplyCellNode.h"
#import "NewsCommentModel.h"

#import "UIColor+VK.h"
#import <Masonry/Masonry.h>
#import "NewsCommentModel.h"

@interface NewsCommentReplyCellNode ()
//UI
@property (nonatomic, strong) UIImageView *imageNode;
@property (nonatomic, strong) UILabel *nameTextNode;
@property (nonatomic, strong) UILabel *locationTextNode;
@property (nonatomic, strong) UIButton *voteBtnNode;
@property (nonatomic, strong) UILabel *contentTextNode;
@property (nonatomic, strong) UIView *underLineNode;

@property (nonatomic, strong) UILabel *floorTextNode;


@end

@implementation NewsCommentReplyCellNode



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"NewsCommentReplyCellNode";
    NewsCommentReplyCellNode *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NewsCommentReplyCellNode alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubnodes];
        [self mas_subViews];
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


-(void)setupCommentItemsModel:(CommentInfoModel *)model{

    [self.imageNode sd_setImageWithURL:[NSURL URLWithString:model.toUserImageUrl] placeholderImage:[UIImage imageNamed:@"defult_pho"]];

    _nameTextNode.text = model.nickName ? model.nickName : @"火星网友";
        _locationTextNode.text = @"地址";//_commentItem.user.location ? _commentItem.user.location : @"火星";
        [_voteBtnNode setTitle:[NSString stringWithFormat:@"%@顶",model.commentId] forState:UIControlStateNormal];
        _contentTextNode.text = model.replyContent;

}



#pragma mark - setter / getter
- (UIImageView *)imageNode
{
    if (!_imageNode) {
        UIImageView *imageNode = [[UIImageView alloc] init];
        imageNode.clipsToBounds = YES;
        imageNode.layer.masksToBounds = YES;
        imageNode.layer.cornerRadius = 40/2;
        _imageNode = imageNode;
        
    }
    return _imageNode;
}

- (UILabel *)nameTextNode
{
    if (!_nameTextNode) {
        UILabel *nameTextNode = [[UILabel alloc] init];
        nameTextNode.font = [UIFont systemFontOfSize:12];
        nameTextNode.textColor = VKColorRGB(186, 177, 161);
        _nameTextNode = nameTextNode;
    }
    return _nameTextNode;
}

- (UILabel *)locationTextNode
{
    if (!_locationTextNode) {
        UILabel *locationTextNode = [[UILabel alloc] init];
        locationTextNode.font = [UIFont systemFontOfSize:12];
        locationTextNode.textColor = VKColorRGB(163, 163, 163);
        _locationTextNode = locationTextNode;
    }
    return _locationTextNode;
}

- (UIButton *)voteBtnNode
{
    if (!_voteBtnNode) {
        UIButton *voteBtnNode = [[UIButton alloc] init];
        voteBtnNode.titleLabel.font = [UIFont systemFontOfSize:12];
        [voteBtnNode setTitleColor:VKColorRGB(163, 163, 163) forState:UIControlStateNormal];
        voteBtnNode.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _voteBtnNode = voteBtnNode;
    }
    return _voteBtnNode;
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
@end
