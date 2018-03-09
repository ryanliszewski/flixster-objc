//
//  MovieViewCell.m
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import "MovieViewCell.h"

@interface MovieViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation MovieViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)bindData:(NSString*)title{
	_titleLabel.text = title;
}

@end
