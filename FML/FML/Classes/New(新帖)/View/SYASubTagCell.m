//
//  SYASubTagCell.m
//  FML
//
//  Created by zengqiang on 16/5/19.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYASubTagCell.h"
#import "SYASubTagItem.h"
#import <UIImageView+WebCache.h>
@interface SYASubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@end
@implementation SYASubTagCell

- (void)awakeFromNib {
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (IBAction)subBtnClick {
}

- (void)setSubTagItem:(SYASubTagItem *)subTagItem

{
    _subTagItem = subTagItem;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:subTagItem.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) {
            return ;
        }
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [clipPath addClip];
        [image drawAtPoint:CGPointZero];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.iconImageView.image = image;
        
    }];
    self.nameLabel.text = subTagItem.theme_name;
    NSInteger num = [subTagItem.sub_number integerValue];
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",subTagItem.sub_number];
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",numF];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    self.numLabel.text = numStr;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end
