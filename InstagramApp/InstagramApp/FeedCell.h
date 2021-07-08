//
//  FeedCell.h
//  InstagramApp
//
//  Created by abenezermolla on 7/6/21.
//
@import Parse;
#import <UIKit/UIKit.h>
#import "Post.h"

#import "Parse/Parse.h"


NS_ASSUME_NONNULL_BEGIN


@interface FeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *feedCaptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedUsernameCaption;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@property (strong, nonatomic) Post *post;


-(void)setPost:(Post *)post;
@end

NS_ASSUME_NONNULL_END
