//
//  ZBContentView.m
//  NewsCommentModule
//
//  Created by power on 2022/10/19.
//

#import "ZBContentView.h"
#import "UIColor+VK.h"

@implementation ZBContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = VKColorRGB(248, 249, 241);
        self.layer.borderColor = VKColorRGB(218, 218, 218).CGColor;
        self.layer.borderWidth = 0.5;
        
        [self addSubnodes];
        [self mas_subViews];
    }
    return self;
}
#pragma mark - private
- (void)addSubnodes
{
    [self addSubview:self.imageNode];
    
    [self addSubview:self.nameTextNode];
    
    [self addSubview:self.locationTextNode];
    
    [self addSubview:self.voteBtnNode];
    
    [self addSubview:self.contentTextNode];
    
    [self addSubview:self.underLineNode];
}

- (void)mas_subViews
{
    [_imageNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(40);
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
    }];
    
    [_voteBtnNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
        make.top.equalTo(_imageNode);
        make.right.equalTo(self).offset(-10);
    }];
    
    [_nameTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageNode);
        make.left.equalTo(_imageNode.mas_right).offset(10);
        make.right.equalTo(_voteBtnNode.mas_left).offset(-10);
    }];
    
    [_locationTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_nameTextNode);
        make.bottom.equalTo(_imageNode.mas_bottom);
    }];

    
    [_contentTextNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageNode.mas_bottom).offset(10);
        make.left.equalTo(_nameTextNode);
        make.right.equalTo(_voteBtnNode);
    }];
    
//    [_commentReplyAreaNode mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_contentTextNode.mas_bottom).offset(10);
//        make.left.equalTo(_nameTextNode);
//        make.right.equalTo(_voteBtnNode);
//    }];
    
    
    
    [_underLineNode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.top.equalTo(_contentTextNode.mas_bottom).offset(10);
        make.left.right.bottom.equalTo(self);
    }];
}




-(void)setupCommentItemsModel:(MessageInfoModel *)model{
    
    
    [self.imageNode sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"defult_pho"]];
    
    _nameTextNode.text = model.nickName ? model.nickName : @"火星网友";
        _locationTextNode.text = @"地址";//_commentItem.user.location ? _commentItem.user.location : @"火星";
        [_voteBtnNode setTitle:[NSString stringWithFormat:@"%@顶",model.praiseCount] forState:UIControlStateNormal];
        _contentTextNode.text = model.content;
    
    
//    NSArray *replyList  = model.replyList;
//
//        if (replyList.count > 1) {
//            [_commentReplyAreaNode mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(_contentTextNode.mas_bottom).offset(10);
//                make.left.equalTo(_nameTextNode);
//                make.right.equalTo(_voteBtnNode);
//            }];
//        }else{
//            [_contentTextNode mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(_imageNode.mas_bottom).offset(10);
//                make.left.equalTo(_nameTextNode);
//                make.right.equalTo(_voteBtnNode);
//            }];
//        }


//    [_commentReplyAreaNode setupCommentItemsArr:replyList];
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
        nameTextNode.font = [UIFont systemFontOfSize:16];
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

//- (NewsCommentReplyAreaNode *)commentReplyAreaNode
//{
//    if (!_commentReplyAreaNode) {
//        NewsCommentReplyAreaNode *commentReplyAreaNode = [[NewsCommentReplyAreaNode alloc] init];
//        _commentReplyAreaNode = commentReplyAreaNode;
//    }
//    return _commentReplyAreaNode;
//}

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
