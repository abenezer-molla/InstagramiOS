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
    NSLog(@"%@", post);
    //self.post = post;
    self.photoImageView.file = post.image;
    self.profilePictureTimeline.file = post.image;
    
    [self.photoImageView loadInBackground];
    self.feedCaptionLabel.text = post.caption;
    
    PFUser *user = post.author;
    self.feedUsernameCaption.text = user.username;
    self.profileNameTimeline.text = user.username;
    

}


@end
