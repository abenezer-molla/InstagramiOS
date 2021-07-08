//
//  FeedCell.m
//  InstagramApp
//
//  Created by abenezermolla on 7/6/21.
//

#import "FeedCell.h"

@implementation FeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    
    NSLog(@"%@", self.photoImageView.file);
    [self.photoImageView loadInBackground];
}






@end
